package org.bbs.controller;

import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import org.bbs.entity.Board;
import org.bbs.entity.Category;
import org.bbs.entity.User;
import org.bbs.service.BoardService;
import org.bbs.service.CategoryService;
import org.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;

	@RequestMapping("/list")
	public String list(Model model)
			throws UnsupportedEncodingException {
		List<Category> categorys = categoryService.listAll();
		Collections.sort(categorys);
		model.addAttribute("categorys", categorys);
		return "admin/board/list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toAdd(Model model) {
		List<Category> categorys = categoryService.listAll();
		Collections.sort(categorys);
		model.addAttribute("categorys", categorys);	
		return "admin/board/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Model model, Board board,Long categoryId) {
		Category c = categoryService.get(categoryId);
		if(c==null){
			List<Category> categorys = categoryService.listAll();
			Collections.sort(categorys);
			model.addAttribute("categorys", categorys);	
			model.addAttribute("board", board);	
			model.addAttribute("error", "分区不存在");
		}
		Board b = boardService.findByName(board.getName(), c);
		if(b!=null){
			List<Category> categorys = categoryService.listAll();
			Collections.sort(categorys);
			model.addAttribute("categorys", categorys);	
			model.addAttribute("board", board);	
			model.addAttribute("error", "版块已存在");
		}
		board.setCategory(c);
		boardService.add(board);
		
		return "redirect:/admin/board/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String toUpdate(Long id, Model model) {
		model.addAttribute("Board", boardService.get(id));
		return "admin/Board/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, Board Board) {

		Board c2 = boardService.get(Board.getId());
		if (c2 != null) {
			c2.setStatus(Board.getStatus());
		}
		boardService.update(c2);
		return "redirect:/admin/board/list";
	}

	@RequestMapping("/delete")
	public String delete(Long id) {
		boardService.delete(id);
		return "redirect:/admin/board/list";
	}

	@RequestMapping(value = "/setModerator", method = RequestMethod.GET)
	public String toSetModerator(Long id, Model model) {
		model.addAttribute("Board", boardService.get(id));
		return "admin/board/setModerator";
	}

	@RequestMapping(value = "/setModerator", method = RequestMethod.POST)
	public String setModerator(Model model, Long id, String usernames) {
		String[] names = usernames.split(",");
		HashSet<String> set = new HashSet<String>();
		for (String name : names) {
			User u = userService.findByUsername(name);
			if (u == null) {
				model.addAttribute("Board", boardService.get(id));
				model.addAttribute("usernames", usernames);
				model.addAttribute("error", "用户" + name + "不存在");
				return "admin/board/setModerator";
			} else {
				set.add(name);
			}
		}
		Board Board = boardService.get(id);
		if (Board != null) {
			Iterator<String> iterator = set.iterator();
			StringBuilder newnames = new StringBuilder();
			String newnamesStr = "";
			while (iterator.hasNext()) {
				String username = iterator.next();
				newnames.append(username + ",");
			}
			if (newnames.length() > 0) {
				newnamesStr = newnames.substring(0, newnames.length() - 1);
			}
			//board.setModerators(newnamesStr);
			boardService.update(Board);
		}
		return "redirect:/admin/board/list";
	}

	@RequestMapping("/moveUp")
	public String moveUp(Long id,Long categoryId) {
		Category c = categoryService.get(categoryId);
		boardService.moveUp(id,c);
		return "redirect:/admin/board/list";
	}

	@RequestMapping("/moveDown")
	public String moveDown(Long id,Long categoryId) {
		Category c = categoryService.get(categoryId);
		boardService.moveDown(id,c);
		return "redirect:/admin/board/list";
	}

}
