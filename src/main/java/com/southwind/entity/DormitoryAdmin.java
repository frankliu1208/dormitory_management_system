package com.southwind.entity;

import lombok.Data;

// entity class
// lombok is a plugin, do not need to write get/set
@Data
public class DormitoryAdmin {
    private Integer id;
    private String username;
    private String password;
    private String name;
    private String gender;
    private String telephone;
}
