package com.sopra.controller.ajax;

import com.sopra.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.transaction.Transactional;
import java.util.List;

import static com.sopra.utils.Endpoints.AJAX_STUDENTS_BASEPATH;

@Controller
@Transactional
@RequestMapping(value = AJAX_STUDENTS_BASEPATH)
public class StudentAjaxController {
    private static final Logger logger = Logger.getLogger(StudentAjaxController.class);

    @Autowired
    private StudentService studentService;

    @RequestMapping(value="/allJson")
    public @ResponseBody List  getAllStudentsJson(){
        logger.info("getAllStudentsAjax()");
         return studentService.getAllStudents();
    }
}
