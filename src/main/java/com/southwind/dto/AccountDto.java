package com.southwind.dto;

import lombok.Data;


// when login, we need to know whether or not the username is correct, or password correct, or both not correct
// DTO, which stands for Data Transfer Object, is a design pattern, to reduce the number of calls when working with remote interfaces.

@Data
public class AccountDto<T> {

    /**
     * for property "code"
     * -1  wrong user
     * -2  wrong password
     * 0  login suceed
     */
    private Integer code;
    private T admin;   // it could be system admin,  or dormitory admin
}
