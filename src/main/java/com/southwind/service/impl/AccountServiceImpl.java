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
    private SystemAdminMapper systemAdminMapper;  // get the object  of SystemAdminMapper interface
    @Autowired
    private DormitoryAdminMapper dormitoryAdminMapper;

    @Override
    public AccountDto login(AccountForm accountForm) {
        AccountDto dto = new AccountDto<>();  // can add systemadmin type or dormitoryadmin type

        //check the user type in switch,  it can be system admin or dormitory admin
        switch (accountForm.getType()){
            case "systemAdmin":  // come from login.jsp  L 36 -39,  go to different page according to different type
                SystemAdmin systemAdmin = this.systemAdminMapper.findByUsername(accountForm.getUsername()); // get the user info from database
                // check if username is correct or not
                if(systemAdmin == null){
                    dto.setCode(-1);  // wrong username
                } else {
                    // check password
                    if(!systemAdmin.getPassword().equals(accountForm.getPassword())){  // the info from accountForm comes from the front end
                        dto.setCode(-2);  // password is wrong
                    } else {  // password correct
                        dto.setCode(0);
                        dto.setAdmin(systemAdmin);  // send systemAdmin object to the dto (AccountDto)
                    }
                }
                break;
            case "dormitoryAdmin":   // come from login.jsp  L 36 -39
                DormitoryAdmin dormitoryAdmin = this.dormitoryAdminMapper.findByUserName(accountForm.getUsername());
                if(dormitoryAdmin == null){
                    dto.setCode(-1);
                } else {
                    if(!dormitoryAdmin.getPassword().equals(accountForm.getPassword())){
                        dto.setCode(-2);
                    } else {
                        dto.setCode(0);
                        dto.setAdmin(dormitoryAdmin);
                    }
                }
                break;
        }
        return dto;
    }
}
