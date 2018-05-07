package com.sopra.service.impl;

import com.sopra.dao.StudenteDAO;
import com.sopra.model.Studente;
import com.sopra.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

//--------------- Gestione della transazione ---------------------

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudenteDAO studenteDAO;
    private static final Logger logger = Logger.getLogger(StudentServiceImpl.class);

    //CREATE
    @Override
    @Transactional
    public void insertStudent(Studente studente){
        logger.info("Inserting student " + studente);
        studenteDAO.insertStudent(studente);
    }

    //READ
    @Override
    @Transactional
    public List getAllStudents(){
        logger.info("Get all students");
        return studenteDAO.getAllStudents();
    }

    //UPDATE
    @Override
    @Transactional
    public void updateStudent(Studente studente){
        logger.info("Updating student " + studente);
        studenteDAO.updateStudent(studente);
    }

    //DELETE
    @Override
    @Transactional
    public void deleteStudent(Studente studente){
        logger.info("Deleting student " + studente);
        studenteDAO.deleteStudent(studente);
    }

    //SEARCH BY ID
    @Override
    @Transactional
    public Studente getStudentById(int data){
        return studenteDAO.getStudentById(data);
    }

    //FILTER BY NAME
    @Override
    @Transactional
    public List filterByName(String data){
        return studenteDAO.filterByName(data);
    }
}
