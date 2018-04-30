package com.sopra.controller.ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.transaction.Transactional;

import static com.sopra.utils.Endpoints.AJAX_STUDENTS_BASEPATH;

@Controller
@Transactional
@RequestMapping(value = AJAX_STUDENTS_BASEPATH)
public class StudentAjaxContoller {

}
