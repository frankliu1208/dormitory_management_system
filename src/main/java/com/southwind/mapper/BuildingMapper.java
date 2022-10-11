package com.southwind.mapper;

import com.southwind.entity.Building;

import java.util.List;

public interface BuildingMapper {
    public List<Building> list(); // search overall list
    public List<Building> searchByName(String value);
    public List<Building> searchByIntroduction(String value);

    // add new building
    public void save(Building building);

    // update the building info
    public void update(Building building);

    // delete the building according to building id
    public void delete(Integer id);
}
