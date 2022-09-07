package com.southwind.service.impl;

import com.southwind.entity.Building;
import com.southwind.mapper.BuildingMapper;
import com.southwind.mapper.DormitoryMapper;
import com.southwind.mapper.StudentMapper;
import com.southwind.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingMapper buildingMapper;
    @Autowired
    private DormitoryMapper dormitoryMapper;
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Building> list() {
        return this.buildingMapper.list();
    }

    @Override
    public List<Building> search(String key, String value) {
        if(value.equals("")) return this.buildingMapper.list();
        List<Building> list = null;
        switch (key){
            case "name":
                list = this.buildingMapper.searchByName(value);
                break;
            case "introduction":
                list = this.buildingMapper.searchByIntroduction(value);
                break;
        }
        return list;
    }

    @Override
    public void save(Building building) {
        try {
            this.buildingMapper.save(building);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Building building) {
        try {
            this.buildingMapper.update(building);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {




        try {
            //找到楼宇包含的所有宿舍
            List<Integer> dormitoryIdList = this.dormitoryMapper.findDormitoryIdByBuildingId(id);
//            Loop the list which includes all the dormitoryid,  for each dormitory id, get the studentId list
            for (Integer dormitoryId : dormitoryIdList) {
                //找到宿舍包含的所有学生
                List<Integer> studentIdList = this.studentMapper.findStudentIdByDormitoryId(dormitoryId);
                for (Integer studentId : studentIdList) {
                    Integer availableDormitoryId = this.dormitoryMapper.findAvailableDormitoryId();
                    //学生调换宿舍
                    this.studentMapper.resetDormitoryId(studentId, availableDormitoryId);
//  for new dormity, as student moves in,  the available bed number should decrease by one
                    this.dormitoryMapper.subAvailable(availableDormitoryId);
                }
                //删除宿舍
                this.dormitoryMapper.delete(dormitoryId);
            }
// 删除楼宇
            this.buildingMapper.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}