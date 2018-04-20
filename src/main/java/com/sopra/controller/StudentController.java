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
import java.util.List;

@Controller
@Transactional
@RequestMapping(value = "/index")
public class StudentController {

    private static final Logger logger = Logger.getLogger(StudentController.class);
    private ModelAndView mv = new ModelAndView("index");

    @Autowired
    private StudentService studentService;
    private  boolean filtered = false;


    @RequestMapping(method = RequestMethod.GET, value = "/all")
    public ModelAndView getPage() {
        List<Studente> studentList = studentService.passingDataForQuery();
        logger.info(studentList);
        mv.addObject("lista", studentList);
        mv.addObject("filtered", filtered);
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/delete")
    public ModelAndView getpage(@RequestParam int id) {
        Studente student  = studentService.passingIdForDelete(id);
        mv.addObject("lista", student);
        return mv;

    }


    @RequestMapping(method = RequestMethod.GET, value = "/filter")
    public ModelAndView getPage(@RequestParam String name) {
        List<Studente> studentList = studentService.passingDataForQuery(name);
        mv.addObject("lista", studentList);
        mv.addObject("filtered", true);
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/modify")
    public ModelAndView showForm(@RequestParam int id) {
        Studente studente = studentService.passingDataForQuery(id);
        logger.info(studente);
//        studentService.modifyStudent(studente.getId(), studente.getFirstname(), studente.getLastname());
        return new ModelAndView("studentView", "studente", studente);

    }


    @RequestMapping(method = RequestMethod.POST, value = "/addStudent")
    public String submit(@ModelAttribute("studente") Studente studente,
                         BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "error";
        }
        model.addAttribute("firstname", studente.getFirstname());
        model.addAttribute("lastname", studente.getLastname());
        model.addAttribute("id", studente.getId());
        logger.info(studente);
        //studentService.modifyStudent(studente.getId(), studente.getFirstname(), studente.getLastname());
        return "studentView";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/insert")
    public String insertIntoDB(ModelMap model) {
        model.addAttribute("firstname", null);
        model.addAttribute("lastname", null);
        model.addAttribute("id", -1);
        return "studentView";
    }




}