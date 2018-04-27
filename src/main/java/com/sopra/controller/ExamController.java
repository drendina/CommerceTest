package com.sopra.controller;

import com.sopra.model.EsameSostenuto;
import com.sopra.service.ExamService;
import com.sopra.service.MatterService;
import com.sopra.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;

import static com.sopra.utils.Endpoints.EXAM_BASEPATH;

@Controller
@Transactional
@RequestMapping(value = EXAM_BASEPATH)
public class ExamController {

    private static final Logger logger = Logger.getLogger(ExamController.class);
    //VIEW
    private ModelAndView examMv = new ModelAndView("examIndex")
            .addObject("exam_basepath", EXAM_BASEPATH);
    @Autowired
    private StudentService studentService;

    @Autowired
    private ExamService examService;

    @Autowired
    private MatterService matterService;

    //CREATE
    @RequestMapping(method = RequestMethod.POST, value = "/insert")
    public ModelAndView insertExam(@ModelAttribute("esameSostenuto") EsameSostenuto esameSostenuto){
        logger.info("insertExam");
        examService.insertExam(esameSostenuto);

        return showAllExams();
    }

    // READ
    @RequestMapping(method = RequestMethod.GET, value = "/examIndex")
    public ModelAndView showAllExams() {
        logger.info("Get all exams");
        examMv.addObject("lista", examService.showAllExams());
        examMv.addObject("studenti", studentService.getAllStudents());
        return examMv;
    }

    // UPDATE

    // DELETE

    //FILTER
    //TODO
    @RequestMapping(method = RequestMethod.GET, value = "/filter")
    public ModelAndView filterByName(@RequestParam String name) {
        examMv.addObject("lista", examService.filterByName(name));
        return examMv;
    }
    //REDIRECT TO A FORM PAGE TO ADD A NEW EXAM
    @RequestMapping(method = RequestMethod.GET, value = "/insertExam")
    public ModelAndView showAddingExamsForm(@ModelAttribute("esame") EsameSostenuto esameSostenuto) {
        logger.info("Show adding form");
        ModelAndView mv = new ModelAndView("examForm");
        mv.addObject("exam", new EsameSostenuto());
        mv.addObject("exam_basepath", EXAM_BASEPATH);
        mv.addObject("listaStudenti", studentService.getAllStudents() );
        mv.addObject("listaMaterie", matterService.getMatterList());
        return mv;
    }
}
