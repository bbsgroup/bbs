package org.bbs.foreground.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("file")
public class FileUploadController {

	@RequestMapping("/upload")
	@ResponseBody
	public void upload(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {

			// 文件保存目录路径
			String savePath = request.getServletContext().getRealPath("/") + "media/attached/";

			// 文件保存目录URL 
			String saveUrl = request.getContextPath() + "/media/attached/";

			// 定义允许上传的文件扩展名
			HashMap<String, String> extMap = new HashMap<String, String>();
			extMap.put("image", "gif,jpg,jpeg,png,bmp");
			extMap.put("flash", "swf,flv");
			extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
			extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

			// 最大文件大小
			long maxSize = 10000000;

			if (!ServletFileUpload.isMultipartContent(request)) {
				out.println(getError("请选择文件。"));
				return;
			}
			// 检查目录
			File uploadDir = new File(savePath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();

			}

			// 检查目录写权限
			if (!uploadDir.canWrite()) {
				out.println(getError("上传目录没有写权限。"));
				return;
			}

			String dirName = request.getParameter("dir");
			if (dirName == null) {
				dirName = "image";
			}
			if (!extMap.containsKey(dirName)) {
				out.println(getError("目录名不正确。"));
				return;
			}
			// 创建文件夹
			savePath += dirName + "/";
			saveUrl += dirName + "/";
			File saveDirFile = new File(savePath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			saveUrl += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}

			Iterator<String> itr = request.getFileNames();
			MultipartFile item = null;
			while (itr.hasNext()) {
				String name = itr.next();
				item = request.getFile(name);
				String fileName = item.getOriginalFilename();
				long fileSize = item.getSize();
				if (fileSize > maxSize) {
					out.println(getError("上传文件大小超过限制。"));
					return;
				}
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(fileExt)) {
					out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
					return;
				}

				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;

				File uploadedFile = new File(savePath, newFileName);
				FileUtils.copyInputStreamToFile(item.getInputStream(), uploadedFile);

				JSONObject obj = new JSONObject();
				obj.put("error", 0);
				obj.put("url", saveUrl + newFileName);
				out.println(obj.toString());
			}

		} catch (Exception e) {
			out.println(getError("上传文件失败。"));
			return;
		}

	}

	@RequestMapping("/fileManager")
	@ResponseBody
	public void fileManager(HttpServletRequest request, HttpServletResponse response) throws Exception, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 根目录路径，可以指定绝对路径，比如 /var/www/attached/
		String rootPath = request.getServletContext().getRealPath("/") + "media/attached/";
		// 根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
		String rootUrl = request.getContextPath() + "/media/attached/";
		// 图片扩展名
		String[] fileTypes = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };

		String dirName = request.getParameter("dir");
		if (dirName != null) {
			if (!Arrays.<String> asList(new String[] { "image", "flash", "media", "file" }).contains(dirName)) {
				out.println("Invalid Directory name.");
				return;
			}
			rootPath += dirName + "/";
			rootUrl += dirName + "/";
			File saveDirFile = new File(rootPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		// 根据path参数，设置各路径和URL
		String path = request.getParameter("path") != null ? request.getParameter("path") : "";
		String currentPath = rootPath + path;
		String currentUrl = rootUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}

		// 排序形式，name or size or type
		String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

		// 不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			out.println("Access is not allowed.");
			return;
		}
		// 最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			out.println("Parameter is not valid.");
			return;
		}
		// 目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if (!currentPathFile.isDirectory()) {
			out.println("Directory does not exist.");
			return;
		}

		// 遍历目录取的文件信息
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		if (currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if (file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if (file.isFile()) {
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String> asList(fileTypes).contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		JSONObject result = new JSONObject();
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);

		response.setContentType("application/json; charset=UTF-8");
		out.println(result.toString());

	}

	private String getError(String message) {
		JSONObject obj = new JSONObject();
		try {
			obj.put("error", 1);
			obj.put("message", message);
		} catch (Exception e) {
			return null;
		}

		return obj.toString();
	}

	public class NameComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir")) && !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir")) && ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filename")).compareTo((String) hashB.get("filename"));
			}
		}
	}

	public class SizeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir")) && !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir")) && ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long) hashA.get("filesize")) > ((Long) hashB.get("filesize"))) {
					return 1;
				} else if (((Long) hashA.get("filesize")) < ((Long) hashB.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}

	public class TypeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir")) && !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir")) && ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filetype")).compareTo((String) hashB.get("filetype"));
			}
		}
	}

	
	@RequestMapping("/uploadAvator")
	@ResponseBody
	public void uploadAvator(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String dir = request.getServletContext().getRealPath("/");
		System.out.println(dir);
		String saveUrl = request.getContextPath();


		String savePath = "/media/avator/"; // 保存图片路径 可以修改

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";

		String _savePath = dir + savePath;

		File uploadDir = new File(_savePath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();

		}
		long savePicName = new Date().getTime();

		String file_src = _savePath + savePicName + "_src.jpg"; // 保存原图
		String filename162 = _savePath + savePicName + "_162.jpg"; // 保存162
		String filename48 = _savePath + savePicName + "_48.jpg"; // 保存48
		String filename20 = _savePath + savePicName + "_20.jpg"; // 保存20

		String pic = request.getParameter("pic");
		String pic1 = request.getParameter("pic1");
		String pic2 = request.getParameter("pic2");
		String pic3 = request.getParameter("pic3");

		if (!pic.equals("") && pic != null) {
			// 原图
			File file = new File(file_src);
			FileOutputStream fout = null;
			fout = new FileOutputStream(file);
			fout.write(new BASE64Decoder().decodeBuffer(pic));
			fout.close();
		}

		// 图1
		File file1 = new File(filename162);
		FileOutputStream fout1 = null;
		fout1 = new FileOutputStream(file1);
		fout1.write(new BASE64Decoder().decodeBuffer(pic1));
		fout1.close();

		// 图2
		File file2 = new File(filename48);
		FileOutputStream fout2 = null;
		fout2 = new FileOutputStream(file2);
		fout2.write(new BASE64Decoder().decodeBuffer(pic2));
		fout2.close();

		// 图3
		File file3 = new File(filename20);
		FileOutputStream fout3 = null;
		fout3 = new FileOutputStream(file3);
		fout3.write(new BASE64Decoder().decodeBuffer(pic3));
		fout3.close();

		String picUrl = saveUrl + savePath + savePicName;
		PrintWriter out = response.getWriter();
		out.println("{\"status\":1,\"picUrl\":\"" + picUrl + "\"}"); // 返回图片地址
	}

}
