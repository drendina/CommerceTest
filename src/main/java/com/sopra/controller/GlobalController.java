package com.sopra.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;

@Controller
@Transactional
@RequestMapping(value = "/index")
public class GlobalController {

    private static final Logger logger = Logger.getLogger(GlobalController.class);
    private ModelAndView mv = new ModelAndView("trueIndex");

    @RequestMapping(value = "/")
    private ModelAndView homePage(){
        logger.info("Deploying Homepage");
        return mv;
    }

}
