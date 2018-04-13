package com.sopra.service.impl;

import com.sopra.dao.StudenteDAO;
import com.sopra.model.Studente;
import com.sopra.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;

//gestione della transazione

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudenteDAO studenteDAO;

    private LinkedList<Studente> studentList;

    @Override
    public LinkedList<Studente> passingDataForQuery(){

        return (LinkedList<Studente>) studenteDAO.selectAll();
    }
    public LinkedList<Studente> passingDataForQuery(int data){

        return studentList = (LinkedList<Studente>) studenteDAO.selectById(data);
    }
    public LinkedList<Studente> passingDataForQuery(String data){

       return studentList = (LinkedList<Studente>) studenteDAO.getStudentList(data);
    }
}