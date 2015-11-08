package org.bbs.foreground.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.base.entity.Page;
import org.base.entity.SystemContext;
import org.base.exception.BusinessException;
import org.bbs.common.Contants;
import org.bbs.entity.Attachment;
import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.entity.Group;
import org.bbs.entity.Reply;
import org.bbs.entity.Topic;
import org.bbs.entity.User;
import org.bbs.service.AttachmentService;
import org.bbs.service.BoardService;
import org.bbs.service.CategoryService;
import org.bbs.service.GroupService;
import org.bbs.service.ReplyService;
import org.bbs.service.TopicService;
import org.bbs.service.UserService;
import org.common.util.PermissionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ForumController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	BoardService boardService;

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	TopicService topicService;

	@Autowired
	UserService userService;

	@Autowired
	GroupService groupService;

	@Autowired
	ReplyService replyService;

	@RequestMapping("/index")
	private String index(Model model) {
		List<Category> list = categoryService.listAll();
		Collections.sort(list);
		model.addAttribute("categorys", list);
		return "bbs/index";

	}

	@RequestMapping(value = "/newTopic", method = RequestMethod.GET)
	private String toNewTopic(Model model, Long id, HttpSession session) throws BusinessException {

		User user = (User) session.getAttribute("currentUser");
		Group group = null;
		if (user == null) {
			group = groupService.get(1l);
		} else {
			group = user.getGroup();
		}
		if (!PermissionUtil.checkPermission(user, group, boardService.get(id), Contants.PERMIT_NEW_TOPIC)) {
			throw new BusinessException("你所在的用户组没有该操作的权限");
		}

		model.addAttribute("board", boardService.get(id));
		return "bbs/newTopic";
	}

	@RequestMapping(value = "/newTopic", method = RequestMethod.POST)
	private String newTopic(Model model, Long id, MultipartHttpServletRequest request, String content, String title,
			String captcha, HttpSession session) throws BusinessException {

		User user = (User) session.getAttribute("currentUser");
		Group group = null;
		if (user == null) {
			group = groupService.get(1l);
		} else {
			group = user.getGroup();
		}
		if (!PermissionUtil.checkPermission(user, group, boardService.get(id), Contants.PERMIT_NEW_TOPIC)) {
			throw new BusinessException("你所在的用户组没有该操作的权限");
		}

		model.addAttribute("title", title);
		model.addAttribute("content", content);
		model.addAttribute("board", boardService.get(id));
		String srccode = (String) session.getAttribute("code");
		if (!srccode.equals(captcha)) {
			model.addAttribute("message", "验证码错误");
			return "bbs/newTopic";

		}

		

		List<Attachment> attachList = new LinkedList<Attachment>();
		Iterator<String> itr = request.getFileNames();
		if (request.getFileMap().size() > 10) {
			// 附件数量超过10
		} else {

			try {

				// 文件保存目录路径
				String savePath = request.getServletContext().getRealPath("/") + "media/attached/";

				// 文件保存目录URL
				String saveUrl = "/media/attached/";

				// 最大文件大小
				long maxSize = 1024 * 1024 * 2;

				if (!ServletFileUpload.isMultipartContent(request)) {
					model.addAttribute("message", "请选择文件");
					return "bbs/newTopic";
				}
				// 检查目录
				File uploadDir = new File(savePath);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();

				}

				// 检查目录写权限
				if (!uploadDir.canWrite()) {
					model.addAttribute("message", "上传附件失败");
					return "bbs/newTopic";

				}

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

				MultipartFile item = null;

				while (itr.hasNext()) {
					String name = itr.next();
					if (name == null || name.equals(""))
						continue;
					item = request.getFile(name);
					String fileName = item.getOriginalFilename();
					String description = request.getParameter("description" + name);
					long fileSize = item.getSize();
					if (fileSize > maxSize) {
						model.addAttribute("message", "文件大小超过限制");
						return "bbs/newTopic";

					}
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

					SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
					String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;

					File uploadedFile = new File(savePath, newFileName);
					FileUtils.copyInputStreamToFile(item.getInputStream(), uploadedFile);
					Attachment attach = new Attachment();
					attach.setDescription(description);
					attach.setSize(fileSize);
					attach.setFilename(fileName);
					attach.setFilepath(saveUrl + newFileName);
					//attachmentService.add(attach);
					attachList.add(attach);
				}

			} catch (Exception e) {
				model.addAttribute("message", "上传附件失败");
				return "bbs/newTopic";
			}
		}

		
		
		Board board = boardService.get(id);
		Category c = board.getCategory();
		Topic topic = new Topic();
		topic.setAttachments(attachList);
		topic.setCategory(c);
		topic.setTitle(title);
		topic.setType(1);
		topic.setContent(content);
		topic.setPostTime(new Date());
		topic.setBoard(board);
		topic.setAuthor(user);
		topic.setLastReplyName(user.getUsername());
		topic.setLastReplyTime(new Date());
		topicService.add(topic);
		for(Attachment attach:attachList){
			attach.setTopic(topic);
			attachmentService.update(attach);
		}

		model.addAttribute("board", board);

		return "redirect:/board?id=" + board.getId();
	}

	@RequestMapping(value = "/newVote", method = RequestMethod.GET)
	private String toNewVote(Model model, Long id, int type) {
		model.addAttribute("board", boardService.get(id));
		return "bbs/newVote";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	private String toBoard(Model model, Long id, HttpSession session) throws BusinessException {

		User user = (User) session.getAttribute("currentUser");
		Board board = boardService.get(id);
		Group group = null;
		if (user == null) {
			group = groupService.get(1l);
		} else {
			group = user.getGroup();
		}
		if (!PermissionUtil.checkPermission(user, group, boardService.get(id), Contants.PERMIT_VISIT)) {
			throw new BusinessException("你所在的用户组没有该操作的权限");
		}
		model.addAttribute("topAll", topicService.findTopAll());

		model.addAttribute("topCategory", topicService.findTopCategory(board.getCategory()));

		model.addAttribute("topBoard", topicService.findTopBoard(board));

		SystemContext.setPageSize(20);

		SystemContext.setOrder("desc");

		SystemContext.setSort("lastReplyTime");

		model.addAttribute("page", topicService.findTopicByBoard(board));

		SystemContext.setPageSize(10);

		SystemContext.removeOrder();

		SystemContext.removeSort();

		model.addAttribute("board", board);

		model.addAttribute("isModerator", PermissionUtil.isModerator(user, board));
		return "bbs/board";
	}

	@RequestMapping(value = "/topic", method = RequestMethod.GET)
	private String topic(Model model, Long id, HttpSession session) throws BusinessException {
		User user = (User) session.getAttribute("currentUser");
		Topic topic = topicService.get(id);
		Board board = topic.getBoard();

		Group group = null;
		if (user == null) {
			group = groupService.get(1l);
		} else {
			group = user.getGroup();
		}
		if (!PermissionUtil.checkPermission(user, group, board, Contants.PERMIT_VISIT)) {
			throw new BusinessException("你所在的用户组没有该操作的权限");
		}

		topic.setViewTimes(topic.getViewTimes() + 1);
		topicService.update(topic);
		board.setLastPostTime(new Date());
		board.setTopicTimes(board.getTopicTimes() + 1);
		boardService.update(board);
		model.addAttribute("topic", topic);
		model.addAttribute("isModerator", PermissionUtil.isModerator(user, board));
		SystemContext.setSort("floor");
		SystemContext.setOrder("asc");
		model.addAttribute("page", replyService.findReplyByTopic(topic));
		SystemContext.removeOrder();
		SystemContext.removeSort();
		return "bbs/topic";
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	private String reply(Model model, Long id, String content, HttpSession session) throws BusinessException {
		User user = (User) session.getAttribute("currentUser");
		Topic topic = topicService.get(id);
		Board board = topic.getBoard();
		Group group = null;
		if (user == null) {
			group = groupService.get(1l);
		} else {
			group = user.getGroup();
		}
		if (!PermissionUtil.checkPermission(user, group, board, Contants.PERMIT_REPLY_TOPIC)) {
			throw new BusinessException("你所在的用户组没有该操作的权限");
		}

		Reply reply = new Reply();
		reply.setAuthor(user);
		reply.setContent(content);
		reply.setTopic(topic);
		reply.setTime(new Date());
		reply.setFloor(replyService.getMaxFloor(topic) + 1);
		replyService.add(reply);
		if (user != null)
			topic.setLastReplyName(user.getUsername());
		topic.setLastReplyTime(new Date());
		topic.setReplyTimes(topic.getReplyTimes() + 1);
		topicService.update(topic);
		model.addAttribute("topic", topic);
		model.addAttribute("isModerator", PermissionUtil.isModerator(user, board));
		board.setLastPostTime(new Date());
		board.setTopicTimes(board.getReplyTimes() + 1);
		boardService.update(board);

		Page<Reply> page = replyService.findReplyByTopic(topic);
		return "redirect:/topic?id=" + id + "&pageNum=" + page.getTotalPage();
	}

	@RequestMapping(value = "/downloadAttachment", method = RequestMethod.GET)
	private void downloadAttachment(Model model, Long id, HttpSession session, HttpServletResponse res,
			HttpServletRequest request) throws BusinessException, IOException {
		User user = (User) session.getAttribute("currentUser");
		Attachment attach = attachmentService.get(id);
		Board board = attach.getTopic().getBoard();
		Group group = null;
		if (user == null) {
			group = groupService.get(1l);
		} else {
			group = user.getGroup();
		}
		if (!PermissionUtil.checkPermission(user, group, board, Contants.PERMIT_DOWNLOAD)) {
			throw new BusinessException("你所在的用户组没有该操作的权限");
		}

		OutputStream os = res.getOutputStream();
		FileInputStream in = null;
		try {
			String fp = request.getSession().getServletContext().getRealPath(attach.getFilepath());
			File f = new File(fp);
			res.reset();
			res.setHeader("Content-Disposition", "attachment; filename=" + attach.getFilename());
			res.setContentType("application/octet-stream; charset=utf-8");

			os.write(FileUtils.readFileToByteArray(f));
			os.flush();
		} finally {
			if (os != null) {
				os.close();
			}
		}
		attach.setDownloadTimes(attach.getDownloadTimes() + 1);
		attachmentService.update(attach);

	}

	@RequestMapping(value = "/register/", method = RequestMethod.GET)
	private String toRegister(Model model) {
		return "bbs/register";
	}

	@RequestMapping("/admin/index")
	private String adminIndex() {
		return "admin/index";

	}

	@RequestMapping("/testUser")
	private String testUser(HttpSession session) {
		User user = userService.findByUsername("admin");
		session.setAttribute("currentUser", user);
		return "redirect:index";

	}
	
	
	@RequestMapping("/closeTopic")
	private String closeTopic() {
		return "redirect:board";

	}
	

	@RequestMapping("/deleteTopic")
	private String deleteTopic(Long id,HttpSession session) throws BusinessException {
		Topic topic = topicService.get(id);
		Board board = null;
		if(topic!=null){
			board= topic.getBoard();
		}	
		User user = (User) session.getAttribute("currentUser");
		Group group = null;
		if (user == null) {
			group = groupService.get(1l);
		} else {
			group = user.getGroup();
		}
		if (!PermissionUtil.checkPermission(user, group, board, Contants.PERMIT_DELETE_POST)) {
			throw new BusinessException("你所在的用户组没有该操作的权限");
		}
		topicService.delete(id);
		return "redirect:board?id="+board.getId();

	}
	
	
	
	

}
