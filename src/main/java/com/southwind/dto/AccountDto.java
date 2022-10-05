package com.southwind.dto;

import lombok.Data;


// when login, we need to know whether or not the username is correct, or password correct, or both not correct, or both correct

// DTO, which stands for Data Transfer Object, is a design pattern, to reduce the number of calls when working with remote interfaces.

/**
 * for the property code
 * -1  wrong user
 * -2  wrong password
 * 0  login suceed
 */

@Data
public class AccountDto<T> {

    private Integer code;
    private T admin;   // it could be system admin,  or dormitory admin
}
