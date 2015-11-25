package org.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ImageUploadUtil {
	public static String uploadHead(HttpServletRequest request , String filename)
			throws Exception {
		// 第一步转化request
		MultipartHttpServletRequest rm = (MultipartHttpServletRequest) request;
		// 获得文件
		CommonsMultipartFile cfile = (CommonsMultipartFile) rm.getFile(filename);
		// 获得文件的字节数组

		byte[] bfile = cfile.getBytes();
		String fileName = "";
		// 获得当前时间的最小精度
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		fileName = format.format(new Date());
		// 获得三位随机数
		Random random = new Random();
		for (int i = 0; i < 3; i++) {
			fileName = fileName + random.nextInt(9);
		}
		// 获得原始文件名
		String origFileName = cfile.getOriginalFilename();
		// XXX.jpg
		String suffix = origFileName.substring(origFileName.lastIndexOf("."));
		// 拿到项目的部署路径
		String path = request.getSession().getServletContext().getRealPath("/");
		// 定义文件的输出流
		OutputStream out = new FileOutputStream(new File(path + "/upload/"
				+ fileName + suffix));
		out.write(bfile);
		out.flush();
		out.close();

		return fileName;
	}
}
