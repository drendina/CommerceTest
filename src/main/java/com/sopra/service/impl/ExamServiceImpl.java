package com.sopra.service.impl;

import com.sopra.dao.ExamDAO;
import com.sopra.model.EsameSostenuto;
import com.sopra.service.ExamService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ExamServiceImpl implements ExamService {
    private static final Logger logger = Logger.getLogger(ExamServiceImpl.class);
    @Autowired
    public ExamDAO examDAO;

    @Override
    @Transactional
    public List filterByName(String data) {
        return examDAO.filterByName(data);
    }

    //CREATE
    @Override
    @Transactional
    public void insertExam(EsameSostenuto esameSostenuto){
        logger.info("insertExam");
        examDAO.insertExam(esameSostenuto);
    }

    //READ
    @Override
    @Transactional
    public List showAllExams(){
        return examDAO.showAllExams();
    }

    //UPDATE

    //DELETE

    //FILTER BY ID
    @Override
    public List showAllExamsByStudentId(int id){
        return examDAO.showAllExamsByStudentId(id);
    }

}
