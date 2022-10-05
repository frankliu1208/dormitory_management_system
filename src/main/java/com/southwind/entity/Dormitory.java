package com.southwind.entity;

import lombok.Data;

// entity class for dormitory information
@Data
public class Dormitory {
    private Integer id;
    private Integer buildingId;
    private String buildingName; // this property is different with the one in database
    private String name;
    private Integer type; // the type of the dormitory, i.e.  4-person room..
    private Integer available; // available bed number of a dormitory,  to evaluate if the dormitory is full or not
    private String telephone;
}
