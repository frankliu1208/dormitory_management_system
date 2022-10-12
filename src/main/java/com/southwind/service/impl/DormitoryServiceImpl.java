package com.southwind.service.impl;

import com.southwind.entity.Dormitory;
import com.southwind.mapper.DormitoryMapper;
import com.southwind.mapper.StudentMapper;
import com.southwind.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DormitoryServiceImpl implements DormitoryService {

    // https://blog.csdn.net/YelloJesse/article/details/113747679
    @Autowired
    private DormitoryMapper dormitoryMapper;
    @Autowired
    private StudentMapper studentMapper;

//    search for available dormitory
    @Override
    public List<Dormitory> availableList() {
        return this.dormitoryMapper.availableList();
    }

    @Override
    public List<Dormitory> list() {
        return this.dormitoryMapper.list();
    }

    @Override
    public List<Dormitory> search(String key, String value) {
        if(value.equals("")) return this.dormitoryMapper.list();
        List<Dormitory> list = null;

        switch (key){
            case "name":  // related to L31-32 in dormitorymanager.jsp
                list = this.dormitoryMapper.searchByName(value);
                break;
            case "telephone":
                list = this.dormitoryMapper.searchByTelephone(value);
                break;
        }
        return list;
    }

    // adding functionality
    @Override
    public void save(Dormitory dormitory) {
        try {
            this.dormitoryMapper.save(dormitory);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // modifying the dormitory
    @Override
    public void update(Dormitory dormitory) {
        try {
            this.dormitoryMapper.update(dormitory);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // delete functioinality
    @Override
    public void delete(Integer id) {
        try {
            // find student id according to the dormitory id, because student need to be moved out when deleting the dormitory
            List<Integer> studentIdList = this.studentMapper.findStudentIdByDormitoryId(id);
            for (Integer studentId : studentIdList) {
                Integer availableDormitoryId = this.dormitoryMapper.findAvailableDormitoryId();
                this.studentMapper.resetDormitoryId(studentId, availableDormitoryId);
                this.dormitoryMapper.subAvailable(availableDormitoryId);
            }
            this.dormitoryMapper.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Dormitory> findByBuildingId(Integer buildingId) {
        return this.dormitoryMapper.findByBuildingId(buildingId);
    }
}
