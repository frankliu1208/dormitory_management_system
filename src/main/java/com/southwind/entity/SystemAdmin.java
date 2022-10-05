package com.southwind.entity;

import lombok.Data;


// System administrator class
// use lombok, no need to get/set method
@Data
public class SystemAdmin {
    private Integer id;
    private String username;
    private String password;
    private String name;
    private String telephone;
}
