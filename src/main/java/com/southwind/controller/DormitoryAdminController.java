package com.southwind.controller;

import com.southwind.entity.DormitoryAdmin;
import com.southwind.service.DormitoryAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * dormitory administration management section
 */
@Controller
@RequestMapping("/dormitoryAdmin")
public class DormitoryAdminController {

    @Autowired
    private DormitoryAdminService dormitoryAdminService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WEB-INF/adminmanager");  // go to adminmanager.jsp
        modelAndView.addObject("list", this.dormitoryAdminService.list()); // go to L75 in adminmanager.jsp
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WEB-INF/adminmanager");
        modelAndView.addObject("list", this.dormitoryAdminService.search(key, value));
        return modelAndView;
    }

    @PostMapping("/save")
    //  return String becuase it is redirect.
    //  in the list in adminmanager.jsp, user types several things, which is automatically put into param dormitoryAdmin,
    // because the name property of input tag in the add modal is same with properties defined in entity class DormitoryAdmin
    public String save(DormitoryAdmin dormitoryAdmin){
        this.dormitoryAdminService.save(dormitoryAdmin);
        return "redirect:/dormitoryAdmin/list";  // go to list() method, load and display all the data
    }

    @PostMapping("/delete")
    // the param id comes from adminmanager.jsp input tag in L283
    public String delete(Integer id){
        this.dormitoryAdminService.delete(id);
        return "redirect:/dormitoryAdmin/list";
    }

    @PostMapping("/update")
    // param dormitoryAdmin comes from adminmanager.jsp update modal
    public String update(DormitoryAdmin dormitoryAdmin){
        this.dormitoryAdminService.update(dormitoryAdmin);
        return "redirect:/dormitoryAdmin/list";
    }
}
