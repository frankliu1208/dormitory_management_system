package com.southwind.entity;

import lombok.Data;

@Data
public class Building {
    // first 4 items is related with the database, fifth is additional
    private Integer id;
    private String name;
    private String introduction;
    private Integer adminId;
    private String adminName;
}
