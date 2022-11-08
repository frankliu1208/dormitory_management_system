package com.southwind.service.impl;

import com.southwind.dto.AccountDto;
import com.southwind.entity.DormitoryAdmin;
import com.southwind.entity.SystemAdmin;
import com.southwind.form.AccountForm;
import com.southwind.mapper.DormitoryAdminMapper;
import com.southwind.mapper.SystemAdminMapper;
import com.southwind.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService {

    // example and detailed explain of autowired,  https://blog.csdn.net/YelloJesse/article/details/113747679
    @Autowired
    private SystemAdminMapper systemAdminMapper;
    @Autowired
    private DormitoryAdminMapper dormitoryAdminMapper;

    @Override
    public AccountDto login(AccountForm accountForm) {

        AccountDto dto = new AccountDto<>();

        //check the user type in switch, in the front-end, user choose "sys admin" or "dorm admin" in the login.jsp in the radio tag
        switch (accountForm.getType()){
            case "systemAdmin":  // come from login.jsp  L 38 -  45,  go to different page according to different type

                SystemAdmin systemAdmin = this.systemAdminMapper.findByUsername(accountForm.getUsername()); // get the user info from database
                // check if username is correct or not
                if(systemAdmin == null){
                    dto.setCode(-1);  // wrong username
                } else {
                    // check password
                    if(!systemAdmin.getPassword().equals(accountForm.getPassword())){  // the info from accountForm comes from the front-end, user enters the password in the login.jsp, user's input kept in accountForm object
                        dto.setCode(-2);  // password is wrong
                    } else {  // password correct
                        dto.setCode(0);
                        dto.setAdmin(systemAdmin);  // send systemAdmin object to the dto (AccountDto class)
                    }
                }
                break;

            case "dormitoryAdmin":   // come from login.jsp  L 38 - 45
                DormitoryAdmin dormitoryAdmin = this.dormitoryAdminMapper.findByUserName(accountForm.getUsername());
                if(dormitoryAdmin == null){
                    dto.setCode(-1); // wrong username
                } else {
                    if(!dormitoryAdmin.getPassword().equals(accountForm.getPassword())){
                        dto.setCode(-2);  // wrong password
                    } else {
                        dto.setCode(0);  // correct password
                        dto.setAdmin(dormitoryAdmin); // set the "dormitoryAdmin" to the property " Admin " of the AccountDto
                    }
                }
                break;
        }
        return dto;
    }
}
