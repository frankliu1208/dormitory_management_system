package com.southwind.mapper;

import com.southwind.entity.Absent;

import java.util.List;


public interface AbsentMapper {
    // the name of the method in this interface is aligned with the id name in AbsentMapper.xml
    public List<Absent> list();
    public List<Absent> searchByBuildingName(String value);
    public List<Absent> searchByDormitoryName(String value);
    public void save(Absent absent);
}
