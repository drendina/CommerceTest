package com.sopra.controller;

import com.sopra.service.MatterService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;
import java.util.List;

import static com.sopra.utils.Endpoints.MATTER_BASEPATH;

@Controller
@Transactional
@RequestMapping(value = MATTER_BASEPATH)
public class MatterController {

    private static final Logger logger = Logger.getLogger(MatterController.class);

    @Autowired
    private MatterService matterService;

    //view
    private ModelAndView matterMv = new ModelAndView("matterIndex");

    //Create
    @RequestMapping(method = RequestMethod.GET, value = "/insertMatter")
    public ModelAndView insertMatter (@RequestParam String matterName) {
        logger.info("insert matter " + matterName);
        matterService.insertMatter(matterName);
        return showMatter();
    }

    //Read
    @RequestMapping(value = "/matterView")
    public ModelAndView showMatter(){
        logger.info("show matters");
        List test = matterService.getMatterList();
        logger.info(test);
        matterMv.addObject("matterList", matterService.getMatterList());
        matterMv.addObject("matter_basepath", MATTER_BASEPATH);
        return matterMv;
    }

    //Update


    //Delete
    @RequestMapping(method = RequestMethod.GET, value = "/filterMatter")
    public ModelAndView filterMatter (@RequestParam String name) {
        logger.info("filter matters");
        matterMv.addObject("matterList", matterService.mattersByName(name));
        return matterMv;
    }
}
