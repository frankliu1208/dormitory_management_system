package com.southwind.mapper;

import com.southwind.entity.Dormitory;

import java.util.List;

public interface DormitoryMapper {
    // 可用的宿舍，还有空床位
    public List<Dormitory> availableList();

    // decrease the number of available bed
    public void subAvailable(Integer id);
    public void addAvailable(Integer id);

//    get dormitory id through buildinig id
    public List<Integer> findDormitoryIdByBuildingId(Integer buildingId);
    public Integer findAvailableDormitoryId();
    public void delete(Integer id);
    public List<Dormitory> list();
    public List<Dormitory> searchByName(String value);
    public List<Dormitory> searchByTelephone(String value);
    public void save(Dormitory dormitory);
    public void update(Dormitory dormitory);
    public List<Dormitory> findByBuildingId(Integer buildingId);
}
