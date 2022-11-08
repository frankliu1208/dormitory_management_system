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


/**
 * Login and exit functionality
 */
@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService accountService;

    // login functionality,  the parameters of login method are from the front-end user input, are packed into an object accountForm
    @PostMapping("/login")
    public ModelAndView login(AccountForm accountForm, HttpSession session){
        AccountDto accountDto = this.accountService.login(accountForm); // after implementing this line, accountDto has the values for its two properties, code and admin
        ModelAndView modelAndView = new ModelAndView();
        switch (accountDto.getCode()){   // get the code and then compare with below cases
            case -1:    // username is wrong
                modelAndView.setViewName("login");  // go to the login page
                modelAndView.addObject("usernameError", "username is not existing"); // go to login.jsp, L29
                break;
            case -2:    // wrong password
                modelAndView.setViewName("login");
                modelAndView.addObject("passwordError", "password is wrong"); // go to login.jsp, L34
                break;
            case 0:   //  login succeeded,  the admin property in AccountDto, need to be put into the seesion
                switch (accountForm.getType()){
                    case "systemAdmin":
                        modelAndView.setViewName("WEB-INF/systemadmin");
                        session.setAttribute("systemAdmin", accountDto.getAdmin());
                        break;
                    case "dormitoryAdmin":
                        modelAndView.setViewName("WEB-INF/dormitoryadmin");
                        session.setAttribute("dormitoryAdmin", accountDto.getAdmin());
                        break;
                }
                break;
        }
        return modelAndView;
    }

    //  exit functionality
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "login";  // go to login.jsp

    }

}
