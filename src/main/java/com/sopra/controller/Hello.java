package com.sopra.controller;

import com.sopra.dBConnection.ProvaJDBC;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;

@Controller("Hello")
public class Hello {

    private static final Logger logger = Logger.getLogger(Hello.class);

    @RequestMapping(method = RequestMethod.GET, value = "/index")
    public ModelAndView getPage() {
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("greetings", "hello there!");
        logger.info("Create page index.jsp");

        ProvaJDBC jdbc = new ProvaJDBC();
        jdbc.useDB();

        return mv;
    }
}