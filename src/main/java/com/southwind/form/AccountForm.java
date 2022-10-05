package com.southwind.form;

import lombok.Data;

/**
 * packed in AccountController, more convenient to get these parameters from the frontend
 * 3 param sent from front-end login.jsp:  username, password, sysadmin or dormitoryadmin
 * with lombok, no need to write get/set method
 */

@Data
public class AccountForm {
    private String username;
    private String password;
    private String type;
}
