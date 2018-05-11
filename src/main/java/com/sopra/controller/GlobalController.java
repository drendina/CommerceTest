package com.sopra.controller;

import com.sopra.form.UserForm;
import com.sopra.model.User;
import com.sopra.service.UserService;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.util.concurrent.atomic.AtomicReference;

@Controller
@Transactional
@RequestMapping(value = "/index")
@SessionAttributes("UserForm")
public class GlobalController {

    private static final Logger logger = Logger.getLogger(GlobalController.class);
    private ModelAndView mv = new ModelAndView("index");
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/")
    public ModelAndView homePage(@ModelAttribute ("user") UserForm userform){
        logger.info("Deploying Homepage");
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/changeLanguageEnglish" )
   public String changeLanguageEnglish( HttpServletResponse response){
        Cookie cookie = new Cookie("org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE", "en");
        cookie.setPath("/");
        response.addCookie(cookie);
        return "redirect:/index/";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/changeLanguageItalian")
    public String changeLanguageItalian(HttpServletResponse response){
        Cookie cookie = new Cookie( "org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE", "it");
        cookie.setPath("/");
        response.addCookie(cookie);
        return "redirect:/index/";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpServletRequest request){
        logger.info("login");
        User user = userService.login(email, password);
        logger.info(user);
        request.getSession().setAttribute("name", user.getName());
        request.getSession().setAttribute("surname", user.getSurname());
        return "redirect:/index/";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/index/";
    }




}
