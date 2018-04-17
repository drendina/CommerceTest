package com.sopra.service.impl;

import com.sopra.dao.StudenteDAO;
import com.sopra.dao.impl.StudenteDAOimpl;
import com.sopra.model.Studente;
import com.sopra.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.LinkedList;
import java.util.List;

//gestione della transazione

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudenteDAO studenteDAO;
    private LinkedList<Studente> studentList;
    private static final Logger logger = Logger.getLogger(StudenteDAOimpl.class);

    @Override
    @Transactional
    public List<Studente> passingDataForQuery(){
        logger.info("get all students ()");
        return (List<Studente>) studenteDAO.selectAll();
    }
    @Override
    @Transactional
    public Studente passingDataForQuery(int data){
    logger.info("passing data for query (ID)");
        return studenteDAO.getStudenteHibernate(data);
    }
    @Override
    @Transactional
    public List<Studente> passingDataForQuery(String data){

       return studentList = (LinkedList<Studente>) studenteDAO.selectByFirstname(data);
    }
}
