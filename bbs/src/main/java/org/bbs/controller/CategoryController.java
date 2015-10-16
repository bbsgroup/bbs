package org.bbs.controller;

import java.io.UnsupportedEncodingException;

import org.base.entity.Page;
import org.base.entity.SystemContext;
import org.bbs.entity.Category;
import org.bbs.entity.User;
import org.bbs.service.CategoryService;
import org.bbs.service.GroupService;
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
	GroupService groupService;

	@RequestMapping("/list")
	public String list(Model model, @RequestParam(required = false) String keyword)
			throws UnsupportedEncodingException {

		Page<Category> page = null;
		SystemContext.setSort("id");
		SystemContext.setOrder("desc");
		if (null != keyword && !("").equals(keyword)) {
			keyword = new String(keyword.getBytes("ISO-8859-1"), "utf-8");
			// page = userService.findByUsernameLike(keyword);
			page = categoryService.findByKeyWordLike("username", keyword);
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
	    	Category c1 = categoryService.findByName(category.getName());
			if (c1 != null) {
				model.addAttribute("category", category);
				model.addAttribute("error", "分区已存在");
				return "admin/category/edit";
			}
			
			
	    	Category c2 = categoryService.get(category.getId());	        
	        if (c2 != null) {     
	            c2.setName(category.getName());    
	          } 
	        categoryService.update(c2);	        
	        return "redirect:/admin/category/list";
	    }
	        
	  
    @RequestMapping("/delete")
    public String delete(Long id){
    	categoryService.delete(id);
        return "redirect:/admin/category/list";
    }
    

}
