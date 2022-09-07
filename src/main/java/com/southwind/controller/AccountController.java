package com.southwind.controller;

import com.southwind.dto.AccountDto;
import com.southwind.form.AccountForm;
import com.southwind.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


// used for login/exist functionality
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    // the parameters from the front end input from user, are packed into an object accountForm
    @PostMapping("/login")
    public ModelAndView login(AccountForm accountForm, HttpSession session){
        AccountDto accountDto = this.accountService.login(accountForm); // after this line, accountDto has the values for its two properties, code and admin
        ModelAndView modelAndView = new ModelAndView();
        switch (accountDto.getCode()){   // get the code and compare with below cases
            case -1:  // username is wrong
                modelAndView.setViewName("login");  // go to the login page
                modelAndView.addObject("usernameError", "username is not existing"); // go to login.jsp, L26
                break;
            case -2:   // wrong password
                modelAndView.setViewName("login");
                modelAndView.addObject("passwordError", "password is wrong"); // go to login.jsp
                break;
            case 0:   // login succeeded,  the admin property in AccountDto, need to be put into the seesion
                switch (accountForm.getType()){
                    case "systemAdmin":
                        modelAndView.setViewName("systemadmin");
                        session.setAttribute("systemAdmin", accountDto.getAdmin());
                        break;
                    case "dormitoryAdmin":
                        modelAndView.setViewName("dormitoryadmin");
                        session.setAttribute("dormitoryAdmin", accountDto.getAdmin());
                        break;
                }

                break;
        }
        return modelAndView;
    }

//    exit functionality,  erase the session
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "login";  // go to login.jsp
        //处理器方法返回的字符串可以指定逻辑视图名，通过视图解析器解析可以将其转换为物理视图地址，返回内部资源逻辑视图名，
        // 若要跳转的资源为内部资源，则视图解析器可以使用 InternalResourceViewResolver 内部资源视图解析器。
    }

}
