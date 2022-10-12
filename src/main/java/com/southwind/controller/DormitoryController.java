package com.southwind.controller;

import com.southwind.entity.Dormitory;
import com.southwind.entity.Student;
import com.southwind.service.BuildingService;
import com.southwind.service.DormitoryService;
import com.southwind.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

// dormitory management section
@Controller
@RequestMapping("/dormitory")
public class DormitoryController {

    @Autowired
    private DormitoryService dormitoryService;
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private StudentService studentService;


    // @RequestMapping("/list"  method = RequestMethod.GET)
    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WEB-INF/dormitorymanager");
        modelAndView.addObject("list", this.dormitoryService.list());
        modelAndView.addObject("buildingList", this.buildingService.list()); // when conducting adding new dormitory, building info is needed. it shall send to the front-end
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("WEB-INF/dormitorymanager");
        modelAndView.addObject("list", this.dormitoryService.search(key, value));
        modelAndView.addObject("buildingList", this.buildingService.list());
        return modelAndView;
    }

    // Adding functionallity
    @PostMapping("/save")
    public String save(Dormitory dormitory){
        this.dormitoryService.save(dormitory);
        return "redirect:/dormitory/list";
    }

    // modifying the dormitory
    @PostMapping("/update")
    public String update(Dormitory dormitory){
        this.dormitoryService.update(dormitory);
        return "redirect:/dormitory/list";
    }

    // delete functionality
    @PostMapping("/delete")
    public String update(Integer id){
        this.dormitoryService.delete(id);
        return "redirect:/dormitory/list";
    }

    @PostMapping("/findByBuildingId")
    @ResponseBody
    public List findByBuildingId(Integer buildingId){
        List<Dormitory> dormitoryList = this.dormitoryService.findByBuildingId(buildingId);
        List list = new ArrayList();
        if(dormitoryList.size() > 0){
            List<Student> studentList = this.studentService.findByDormitoryId(dormitoryList.get(0).getId());
            list.add(dormitoryList);
            list.add(studentList);
        } else {
            list.add(new ArrayList<>());
            list.add(new ArrayList<>());
        }
        return list;
    }
}
