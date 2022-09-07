package com.southwind.controller;

import com.southwind.entity.Building;
import com.southwind.service.BuildingService;
import com.southwind.service.DormitoryAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/building")
public class BuildingController {

    @Autowired
    private BuildingService buildingService;
    @Autowired
    private DormitoryAdminService dormitoryAdminService;

    @GetMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("buildingmanager");
        modelAndView.addObject("list", this.buildingService.list());
//        admin related info send to front page
        modelAndView.addObject("dormitoryAdminList", this.dormitoryAdminService.list());
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView search(String key,String value){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("buildingmanager");
        modelAndView.addObject("list", this.buildingService.search(key, value));
        modelAndView.addObject("dormitoryAdminList", this.dormitoryAdminService.list());
        return modelAndView;
    }

//    添加，
    @PostMapping("/save")
    public String save(Building building){
        this.buildingService.save(building);
//        after successfully add the data, redirect to list(),  load all the data
        return "redirect:/building/list";
    }

    @PostMapping("/update")
    public String update(Building building){
        this.buildingService.update(building);
        return "redirect:/building/list";
    }

//   when deleting a buidling, we need also to deal with students and dormitories, which are related to the building
//    when one building is deleted, the dormitory not exists anymore, but students need to be re/assigned to new dormitory
    @PostMapping("/delete")
//    get the building id from the front end page
    public String delete(Integer id){
        this.buildingService.delete(id);
        return "redirect:/building/list";
    }
}
