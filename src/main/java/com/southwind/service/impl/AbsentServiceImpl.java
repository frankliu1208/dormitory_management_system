package com.southwind.service.impl;

import com.southwind.entity.Absent;
import com.southwind.mapper.AbsentMapper;
import com.southwind.service.AbsentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AbsentServiceImpl implements AbsentService {

    // https://blog.csdn.net/YelloJesse/article/details/113747679
    @Autowired
    private AbsentMapper absentMapper;

    @Override
    public List<Absent> list() {
        return this.absentMapper.list();
    }

    @Override
    public List<Absent> search(String key, String value) {
        if(value.equals("")) return this.absentMapper.list();
        List<Absent> list = null;
        switch (key){
            case "buildingName":
                list = this.absentMapper.searchByBuildingName(value);
                break;
            case "dormitoryName":
                list = this.absentMapper.searchByDormitoryName(value);
                break;
        }
        return list;
    }

    @Override
    public void save(Absent absent) {
        try {
            this.absentMapper.save(absent);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
