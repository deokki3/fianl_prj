package com.jhta.neocom.admin.controller;

import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * CategoryController
 */

@Controller
public class CategoryController {
    @Autowired
    private CategoryService service;

    @Value("spring.servlet.multipart.location")
    private String path;

    // INSERT
    @GetMapping("/admin/cate/cateinsert")
    public String insertForm() {
        return "admin/menu/cate/cateinsert";
    }

    @PostMapping("/admin/cate/cateinsert")
    public String insert(CategoryVo vo, Model model) {
        service.insert(vo);

        return "redirect:/admin/cate/catelist";
    }

    // DELETE
    @RequestMapping("/admin/cate/delete")
    public String delete(int category_id) {
        service.delete(category_id);
        return "redirect:/admin/cate/catelist";
    }

    // Update
    @PostMapping("/admin/cate/update")
    public String update(CategoryVo vo, Model model) {
        System.out.println(vo);
        service.update(vo);
        return "redirect:/admin/cate/catelist";
    }

    // LIST
    @RequestMapping("/admin/cate/catelist")
    public ModelAndView list_admin() {
        System.out.println("패스:" + path);
        ModelAndView mv = new ModelAndView("/admin/menu/cate/catelist");
        mv.addObject("list", service.list());

        return mv;
    }

}