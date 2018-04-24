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

    @Override
    @Transactional
    public List passingDataForQuery(){
        return studenteDAO.getAllStudentsHibernate();
    }
    @Override
    @Transactional
    public Studente passingDataForQuery(int data){
        logger.info("passing data for query (ID)");
        return studenteDAO.getStudenteIdHibernate(data);
    }
    @Override
    @Transactional
    public List passingDataForQuery(String data){
       return studenteDAO.getStudenteStringHibernate(data);
    }

    @Override
    @Transactional
    public void modifyStudent(Studente studente){
        logger.info("hi, i'm the service and i'm trying to modify one student" + studente);
        studenteDAO.updateRecord(studente);
    }
    @Override
    @Transactional
    public Studente passingIdForDelete(int id){
        logger.info("deleting student with id: "+id);
        return studenteDAO.deleteById(id);
    }

    @Override
    @Transactional
    public void insertNewStudent(String firstname, String lastname){
        studenteDAO.insertHibernate(firstname, lastname);
    }


}
