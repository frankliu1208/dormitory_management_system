package com.southwind.entity;

import lombok.Data;


// entity class used for move-out register and move-out record
@Data
public class Moveout {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private Integer dormitoryId;
    private String dormitoryName;
    private String reason;
    private String createDate;
}
