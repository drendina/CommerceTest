package com.sopra.controller.ajax;

import com.sopra.service.MatterService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static com.sopra.utils.Endpoints.AJAX_MATTERS_BASEPATH;

@Controller
@Transactional
@RequestMapping(value = AJAX_MATTERS_BASEPATH)
public class MatterAjaxController {
    private static final Logger logger = Logger.getLogger(MatterAjaxController.class);

    @Autowired
    private MatterService matterService;

    @RequestMapping(value="/allMatterJson")
    public @ResponseBody List getAllMatterJson(){
        logger.info("getAllMatterAjax()");
        return matterService.getMatterList();
    }

}
