package com.southwind.service.impl;

import com.southwind.entity.Building;
import com.southwind.mapper.BuildingMapper;
import com.southwind.mapper.DormitoryMapper;
import com.southwind.mapper.StudentMapper;
import com.southwind.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// Building management
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

    // add new building
    @Override
    public void save(Building building) {
        try {
            this.buildingMapper.save(building);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // update the building info
    @Override
    public void update(Building building) {
        try {
            this.buildingMapper.update(building);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // delete the building
    @Override
    public void delete(Integer id) {

        try {
            // find all the related dormitory in the building
            List<Integer> dormitoryIdList = this.dormitoryMapper.findDormitoryIdByBuildingId(id);
            //    Loop the list which includes all the dormitoryid,  for each dormitory id, get the studentId list
            for (Integer dormitoryId : dormitoryIdList) {
                // find the all related students according to dormitory id,  in studentIdList includes all the student id
                List<Integer> studentIdList = this.studentMapper.findStudentIdByDormitoryId(dormitoryId);
                for (Integer studentId : studentIdList) {
                    Integer availableDormitoryId = this.dormitoryMapper.findAvailableDormitoryId();
                    //students will change to another dormitory (for one loop only operates one student)
                    this.studentMapper.resetDormitoryId(studentId, availableDormitoryId);
                    //  for new dormity, as student moves in,  the available bed number should decrease by one
                    this.dormitoryMapper.subAvailable(availableDormitoryId);
                }
                //  delete the dormitory, because student has already been moved to another dormitory
                this.dormitoryMapper.delete(dormitoryId);
            }
            // delete the building according to building id
            this.buildingMapper.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
