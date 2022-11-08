package com.southwind.controller;

import com.southwind.entity.Student;
import com.southwind.service.DormitoryService;
import com.southwind.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

// student management functionality
@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private DormitoryService dormitoryService;

    // display the overall list
    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WEB-INF/studentmanager");  // go to studentmanager.jsp
        modelAndView.addObject("list", this.studentService.list());
        //  add available dormitory info. this is used for the updating modal
        modelAndView.addObject("dormitoryList", this.dormitoryService.availableList());
        return modelAndView;
    }

    // search functionality
    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WEB-INF/studentmanager");
        modelAndView.addObject("list", this.studentService.search(key, value));
        modelAndView.addObject("dormitoryList", this.dormitoryService.availableList());
        return modelAndView;
    }

    // adding functionality,  comes from studentmanager.jsp L116
    @PostMapping("/save")
    public String save(Student student){
        this.studentService.save(student);
        return "redirect:/student/list";
    }

    // update functionality,  data comes from studentmanager.jsp L181
    @PostMapping("/update")
    public String update(Student student){
        this.studentService.update(student);
        return "redirect:/student/list";
    }

    // delete function,  get id and dormitory id from the studentmanager.jsp,  use student as parameter to get them.
    @PostMapping("/delete")
    public String delete(Student student){
        this.studentService.delete(student);
        return "redirect:/student/list";
    }

    //  related to absentregister.jsp  L132
    @PostMapping("/findByDormitoryId")
    @ResponseBody
    public List<Student> findByDormitoryId(Integer dormitoryId){
        return this.studentService.findByDormitoryId(dormitoryId);
    }
}
