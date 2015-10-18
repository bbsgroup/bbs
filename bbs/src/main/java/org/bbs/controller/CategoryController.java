package org.bbs.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Iterator;

import org.base.entity.Page;
import org.base.entity.SystemContext;
import org.bbs.entity.Category;
import org.bbs.entity.User;
import org.bbs.service.CategoryService;
import org.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin/category")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService userService;

	@RequestMapping("/list")
	public String list(Model model, @RequestParam(required = false) String keyword)
			throws UnsupportedEncodingException {

		Page<Category> page = null;
		SystemContext.setSort("sort");
		SystemContext.setOrder("asc");
		if (null != keyword && !("").equals(keyword)) {
			keyword = new String(keyword.getBytes("ISO-8859-1"), "utf-8");
			// page = userService.findByUsernameLike(keyword);
			page = categoryService.findByKeyWordLike("name", keyword);
			model.addAttribute("keyword", keyword);
		} else
			page = categoryService.findPage();
		SystemContext.removeOrder();
		SystemContext.removeSort();
		model.addAttribute("page", page);
		return "admin/category/list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toAdd(User user, Model model) {
		return "admin/category/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Model model, Category category) {

		Category c = categoryService.findByName(category.getName());
		if (c != null) {
			model.addAttribute("category", category);
			model.addAttribute("error", "分区已存在");
			return "admin/category/add";
		}

		categoryService.add(category);
		return "redirect:/admin/category/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String toUpdate(Long id, Model model) {
		model.addAttribute("category", categoryService.get(id));
		return "admin/category/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, Category category) {

		Category c2 = categoryService.get(category.getId());
		if (c2 != null) {
			c2.setStatus(category.getStatus());
		}
		categoryService.update(c2);
		return "redirect:/admin/category/list";
	}

	@RequestMapping("/delete")
	public String delete(Long id) {
		categoryService.delete(id);
		return "redirect:/admin/category/list";
	}

	@RequestMapping(value = "/setModerator", method = RequestMethod.GET)
	public String toSetModerator(Long id, Model model) {
		model.addAttribute("category", categoryService.get(id));
		return "admin/category/setModerator";
	}

	@RequestMapping(value = "/setModerator", method = RequestMethod.POST)
	public String setModerator(Model model, Long id, String usernames) {
		String[] names = usernames.split(",");
		HashSet<String> set = new HashSet<String>();
		for (String name : names) {
			User u = userService.findByUsername(name);
			if (u == null) {
				model.addAttribute("category", categoryService.get(id));
				model.addAttribute("usernames", usernames);
				model.addAttribute("error", "用户" + name + "不存在");
				return "admin/category/setModerator";
			} else {
				set.add(name);
			}
		}
		Category category = categoryService.get(id);
		if (category != null) {
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
			category.setModerators(newnamesStr);
			categoryService.update(category);
		}
		return "redirect:/admin/category/list";
	}

	@RequestMapping("/moveUp")
	public String moveUp(Long id) {
		categoryService.moveUp(id);
		return "redirect:/admin/category/list";
	}

	@RequestMapping("/moveDown")
	public String moveDown(Long id) {
		categoryService.moveDown(id);
		return "redirect:/admin/category/list";
	}

}
