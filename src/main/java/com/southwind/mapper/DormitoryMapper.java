package com.southwind.mapper;

import com.southwind.entity.Dormitory;

import java.util.List;

public interface DormitoryMapper {

    // get all the dormitory which has the empty bed
    public List<Dormitory> availableList();

    // decrease the number of available bed
    public void subAvailable(Integer id);
    public void addAvailable(Integer id);

    //  this method is to  get dormitory id by buildinig id
    public List<Integer> findDormitoryIdByBuildingId(Integer buildingId);

    // search for teh dormitory id which has empty beds
    public Integer findAvailableDormitoryId();
    // delete the dormitory according to dormitory id
    public void delete(Integer id);
    public List<Dormitory> list();
    public List<Dormitory> searchByName(String value);
    public List<Dormitory> searchByTelephone(String value);
    public void save(Dormitory dormitory);
    public void update(Dormitory dormitory);
    public List<Dormitory> findByBuildingId(Integer buildingId);
}
