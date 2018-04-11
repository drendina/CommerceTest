package com.sopra.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("Saluti"git )
public class Saluti {

    @Autowired
    private static final Logger logger = Logger.getLogger(Hello.class);

    @RequestMapping(method = RequestMethod.GET, value="/firstpage")
    public ModelAndView getPage1(){
        ModelAndView mv1 = new ModelAndView("firstpage");
        mv1.addObject("saluti", "Ciao!");
        logger.info("Create page firstpage.jsp");
        return mv1;
    }
}
