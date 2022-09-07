package com.southwind.controller;

import com.southwind.entity.DormitoryAdmin;
import com.southwind.service.DormitoryAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dormitoryAdmin")
public class DormitoryAdminController {

    @Autowired
    private DormitoryAdminService dormitoryAdminService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("adminmanager");  // go to adminmanager.jsp
        modelAndView.addObject("list", this.dormitoryAdminService.list());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("adminmanager");
        modelAndView.addObject("list", this.dormitoryAdminService.search(key, value));
        return modelAndView;
    }

    @PostMapping("/save")
//    not return ModelAndView becuase it is redirect,  因为表单上德name和实体类一致，可以自动封装
    public String save(DormitoryAdmin dormitoryAdmin){
        this.dormitoryAdminService.save(dormitoryAdmin);
        return "redirect:/dormitoryAdmin/list";  // go to list() method, load and display all the data
    }

    @PostMapping("/delete")
    public String delete(Integer id){
        this.dormitoryAdminService.delete(id);
        return "redirect:/dormitoryAdmin/list";
    }

    @PostMapping("/update")
    // 参数dormitoryAdmin被自动封装
    public String update(DormitoryAdmin dormitoryAdmin){
        this.dormitoryAdminService.update(dormitoryAdmin);
        return "redirect:/dormitoryAdmin/list";
    }
}
