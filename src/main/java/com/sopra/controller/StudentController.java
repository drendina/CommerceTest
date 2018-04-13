package com.sopra.controller;

import com.sopra.model.Studente;
import com.sopra.service.StudentService;
//import org.apache.log4j.Logger;
import com.sopra.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedList;

@Controller
@RequestMapping(value = "/index")
public class StudentController {

//    private static final Logger logger = Logger.getLogger(StudentController.class);
    private ModelAndView mv = new ModelAndView("index");

    @Autowired
    private StudentService studentService;
    private String name = null;

    @RequestMapping(method = RequestMethod.GET, value="/all")
    public ModelAndView getPage() {
        LinkedList<Studente> studentList = studentService.passingDataForQuery();
        mv.addObject("lista",studentList);
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET, value="/filter")
    public ModelAndView getPage(@RequestParam String name) {
        LinkedList<Studente> studentList = studentService.passingDataForQuery(name);
        mv.addObject("lista", studentList);
        return mv;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/modify" )
    public ModelAndView showForm (@RequestParam int id){
        LinkedList<Studente> studentList = studentService.passingDataForQuery(id);

        //DA MODIFICARE, TOGLIERE LA NEW E RIMPIAZZARLA CON UNA CHIAMATA AL SERVICE PER IL RECUPERO DEL DATO DAL DB
        return new ModelAndView("studentView", "studente", );
    }

    @RequestMapping( method = RequestMethod.POST, value = "/addStudent")
    public String submit( @ModelAttribute("studente")Studente studente,
                         BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "error";
        }
        model.addAttribute("firstname", studente.getFirstname());
        model.addAttribute("lastname", studente.getLastname());
        model.addAttribute("id", studente.getId());
        return "studentView";
    }
}