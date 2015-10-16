package org.bbs.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import org.base.entity.Page;
import org.base.entity.SystemContext;
import org.bbs.entity.User;
import org.bbs.service.GroupService;
import org.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin/user")
public class UserController {
    
    @Autowired
    UserService userService;
    @Autowired
    GroupService groupService;
    
    @RequestMapping("/list")
    public String list(Model model, @RequestParam(required = false) String keyword) throws UnsupportedEncodingException {
        
        Page<User> page = null;
        SystemContext.setSort("id");
        SystemContext.setOrder("desc");
        if (null != keyword && !("").equals(keyword)) {
            keyword = new String(keyword.getBytes("ISO-8859-1"), "utf-8");
            // page = userService.findByUsernameLike(keyword);
            page = userService.findByKeyWordLike("username", keyword);
            model.addAttribute("keyword", keyword);
        } else page = userService.findPage();
        SystemContext.removeOrder();
        SystemContext.removeSort();
        model.addAttribute("page", page);
        return "admin/user/list";
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String toAdd(User user, Model model) {
        model.addAttribute("groups", groupService.listAll());
        return "admin/user/add";
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Model model, User user, @RequestParam(required = false) Long[] roleIds) {
        
        User u = userService.findByUsername(user.getUsername());
        if (u != null) {
            model.addAttribute("user", user);
            model.addAttribute("error", "用户已存在");
            return "admin/user/add";
        }
        try {
            u = userService.findByEmail(user.getEmail());
        } catch (Exception e) {
            model.addAttribute("user", user);
            model.addAttribute("error", "邮箱已被占用");
            return "admin/user/add";
        }
    
        user.setCreateDate(new Date());
        userService.createUser(user);
        return "redirect:/admin/user/list";
    }
    

}
