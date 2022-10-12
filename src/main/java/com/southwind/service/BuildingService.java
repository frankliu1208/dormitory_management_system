package com.southwind.service;

import com.southwind.entity.Building;

import java.util.List;


// Building management
public interface BuildingService {

    public List<Building> list();
    public List<Building> search(String key,String value);

    // adding new building
    public void save(Building building);
    // update the building info
    public void update(Building building);
    // delete the building
    public void delete(Integer id);
}
