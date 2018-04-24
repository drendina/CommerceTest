package com.sopra.controller;

import com.sopra.model.Studente;
import com.sopra.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;


@Controller
@Transactional
@RequestMapping(value = "/index")
public class StudentController {

    private static final Logger logger = Logger.getLogger(StudentController.class);
    private ModelAndView mv = new ModelAndView("index");

    @Autowired
    private StudentService studentService;



    @RequestMapping(method = RequestMethod.GET, value = "/all")
    public ModelAndView getPage() {
        logger.info(studentService.passingDataForQuery());
        mv.addObject("lista", studentService.passingDataForQuery());
        mv.addObject("filtered", false);
        return mv;
    }

    @RequestMapping(value = "/index")
    public ModelAndView getHomePage(){
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/delete")
    public ModelAndView getpage(@RequestParam int id) {
        mv.addObject("lista", studentService.passingIdForDelete(id));
        return getPage();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/insert")
    public ModelAndView insertIntoDB(@RequestParam String firstname, String lastname ) {
        logger.info("insert");
        studentService.insertNewStudent(firstname, lastname);
        mv.addObject("lista", studentService.passingDataForQuery());
        return mv;
    }


    @RequestMapping(method = RequestMethod.GET, value = "/filter")
    public ModelAndView getPage(@RequestParam String name) {
        mv.addObject("lista", studentService.passingDataForQuery(name));
        mv.addObject("filtered", true);
        return mv;
    }



    @RequestMapping(method = RequestMethod.GET, value = "/modify")
    public ModelAndView showForm(@RequestParam int id) {
        Studente studente = studentService.passingDataForQuery(id);
        logger.info(studente);

        return new ModelAndView("studentView", "studente", studente);
    }


    @RequestMapping(method = RequestMethod.POST, value = "/updateStudent")
    public String updateStudent (@ModelAttribute("studente") Studente studente, BindingResult result, ModelMap model) {
//        if (result.hasErrors()) { return "error"; }
//        model.addAttribute("firstname", studente.getFirstname());
//        model.addAttribute("lastname", studente.getLastname());
//        model.addAttribute("id", studente.getId());
        studentService.modifyStudent(studente);
        logger.info(studente);
        return "studentView";
    }



}





