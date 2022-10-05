package com.southwind.entity;

import lombok.Data;

// student management  entity class
@Data
public class Student {
    private Integer id;
    private String number;
    private String name;
    private String gender;
    private Integer dormitoryId;
    private Integer oldDormitoryId;
    private String dormitoryName;  // not exist in database
    private String state;
    private String createDate;
}
