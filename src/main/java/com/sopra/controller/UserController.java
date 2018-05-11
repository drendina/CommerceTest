package com.sopra.controller;

import com.sopra.form.UserForm;
import com.sopra.model.User;
import com.sopra.service.UserService;
import com.sopra.utils.SessionServlet;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import static com.sopra.utils.Endpoints.REGISTRATION_BASEPATH;

@Controller
@Transactional
@RequestMapping(value = REGISTRATION_BASEPATH)
public class UserController {

    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView showRegistrationForm(@ModelAttribute ("user") UserForm userForm) {
        User user = new User();
        return new ModelAndView("registration", "user", user);
    }


    @RequestMapping(method = RequestMethod.POST, value = "/register")
    public ModelAndView registerNewUser(@ModelAttribute ("user") UserForm userForm){
        logger.info("registerNewUser" + userForm);
        User user = new User(userForm.getName(),
                userForm.getSurname(),
                userForm.getEmail(),
                userForm.getPassword());
        userService.registerNewUser(user);
        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security");
        model.addObject("message", "This is protected page!");
        model.setViewName("index");

        return model;
    }






}