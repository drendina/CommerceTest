package com.sopra.controller;

import com.sopra.form.StudenteForm;
import com.sopra.model.EsameSostenuto;
import com.sopra.model.Studente;
import com.sopra.service.ExamService;
import com.sopra.service.MatterService;
import com.sopra.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;
import javax.validation.Valid;

import static com.sopra.utils.Endpoints.*;


@Controller
@Transactional
@RequestMapping(value = STUDENT_BASEPATH)
public class StudentController {

    private static final Logger logger = Logger.getLogger(StudentController.class);
    private ModelAndView mv = new ModelAndView("studentIndex");
    private ModelAndView bio = new ModelAndView("studentBio");

    @Autowired
    private StudentService studentService;

    @Autowired
    private ExamService examService;

    @Autowired
    private MatterService matterService;

    //CREATE
    @RequestMapping(method = RequestMethod.GET, value = "/insert")
    public ModelAndView insertStudent(@ModelAttribute("studente") Studente studente) {
        logger.info("Insert student " + studente);
        studentService.insertStudent(studente);
        return showAllStudents();
    }

    //READ
    @RequestMapping(method = RequestMethod.GET, value = "/all")
    public ModelAndView showAllStudents() {
        logger.info("Get all students");
        mv.addObject("lista", studentService.getAllStudents());
        mv.addObject("student_basepath", STUDENT_BASEPATH);
        mv.addObject("ajax_students_basepath", AJAX_STUDENTS_BASEPATH);
        return mv;
    }

    //UPDATE
    @RequestMapping(method = RequestMethod.POST, value = "/updateStudent")
    public ModelAndView updateStudent (@Valid @ModelAttribute("studenteForm") StudenteForm studenteForm,
                                       BindingResult bindingResult) {
        logger.info("Update student: " + studenteForm);
        if(bindingResult.hasErrors()){

            return new ModelAndView("modify", "studenteForm", studenteForm);
        }
        else{
            Studente studenteTemp = new Studente(studenteForm.getFirstname(), studenteForm.getLastname());
            studentService.updateStudent(studenteTemp);
            return showAllStudents();

        }

    }

    //DELETE
    @RequestMapping(method = RequestMethod.GET, value = "/delete")
    public ModelAndView deleteStudent(@RequestParam int id) {

        Studente studente = studentService.getStudentById(id);
        logger.info("Delete student: " + studente);
        studentService.deleteStudent(studente);
        return showAllStudents();
    }

    //FILTER BY NAME
    @RequestMapping(method = RequestMethod.GET, value = "/filter")
    public ModelAndView filterByName(@RequestParam String name) {
        mv.addObject("lista", studentService.filterByName(name));
        return mv;
    }

    //CALL FORM VIEW TO MODIFY SELECTED STUDENT
    @RequestMapping(method = RequestMethod.GET, value = "/modify")
    public ModelAndView showModForm(@RequestParam int id) {
        Studente studente = studentService.getStudentById(id);
        logger.info("student: " + studente);
        ModelAndView mv = new ModelAndView("modify");

        mv.addObject("studenteForm", studente);
        mv.addObject("action", STUDENT_BASEPATH.concat("/updateStudent"));

        return mv;
    }

    //BIO VIEW
    @RequestMapping(method = RequestMethod.GET, value = "/studentBio")
    public ModelAndView showStudentBio(@RequestParam int id){
        bio.addObject("studente", studentService.getStudentById(id));
        bio.addObject("listaEsami",examService.showAllExamsByStudentId(id));
        bio.addObject("student_basepath", STUDENT_BASEPATH);
        bio.addObject("listaMaterie", matterService.getMatterList());
        bio.addObject("esame", new EsameSostenuto(id));
        bio.addObject("exam_basepath",EXAM_BASEPATH);
        return bio;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/studentBio")
    public ModelAndView insertExam (@ModelAttribute("esame") EsameSostenuto esameSostenuto){
        logger.info(esameSostenuto);
        examService.insertExam(esameSostenuto);
        return bio;
    }



}


