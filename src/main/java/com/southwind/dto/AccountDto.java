package com.southwind.dto;

import lombok.Data;


// when login, we need to know whether or not the username is correct, or
// password correct, or both not correct, or both correct
// 泛型类  为了提高重用性， 如 public class Container<K, V>{ ...}  在编译期，是无法知道K和V具体是什么类型，只有在运行时才会真正根据类型来构造和分配内存。


// DTO, which stands for Data Transfer Object, is a design pattern
// to reduce the number of calls when working with remote interfaces.


@Data
public class AccountDto<T> {
    /**
     * -1  wrong user
     * -2  wrong password
     * 0  login suceed
     */
    private Integer code;
    private T admin;  // it could be system admin,  or dormitory admin
}
