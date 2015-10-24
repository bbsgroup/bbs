package org.bbs.foreground.controller;

import java.util.Collections;
import java.util.List;

import org.bbs.entity.Category;
import org.bbs.service.BoardService;
import org.bbs.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ForumController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	BoardService boardService;

	@RequestMapping("/index")
	private String index(Model model) {
		List<Category> list = categoryService.listAll();
		Collections.sort(list);
		model.addAttribute("categorys", list);
		return "bbs/index";

	}
	
	
	@RequestMapping(value = "/newTopic", method = RequestMethod.GET)
	private String toNewTopic(Model model, Long id,int type) {
		model.addAttribute("board", boardService.get(id));
		return "bbs/newTopic";
	}
	
	@RequestMapping(value = "/newVote", method = RequestMethod.GET)
	private String toNewVote(Model model, Long id,int type) {
		model.addAttribute("board", boardService.get(id));
		return "bbs/newVote";
	}
	
	

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	private String toBoard(Model model, Long id) {
		model.addAttribute("board", boardService.get(id));
		return "bbs/board";
	}

	@RequestMapping(value = "/register/", method = RequestMethod.GET)
	private String toRegister(Model model) {
		return "bbs/register";
	}

	@RequestMapping("/admin/index")
	private String adminIndex() {
		return "admin/index";

	}

}
