package com.sopra.dao.impl;

import com.sopra.dao.ExamDAO;
import com.sopra.model.EsameSostenuto;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class ExamDAOimpl implements ExamDAO {
    @Autowired
    private SessionFactory sessionFactory;
    private static final Logger logger =
            Logger.getLogger(ExamDAOimpl.class);


    @Override
    public List filterByName(String name){
        //TODO
        return null;
    }
    @Override
    public List showAllExams(){
        logger.info("Get all exams");
        return sessionFactory.getCurrentSession()
                .createQuery("FROM EsameSostenuto")
                .list();
    }
    @Override
    public void insertExam(EsameSostenuto esameSostenuto){
        logger.info("insertExam");
        sessionFactory.getCurrentSession()
                .persist(esameSostenuto);
    }

    // DELETE
    @Override
    public void deleteExam(EsameSostenuto esameSostenuto){
        sessionFactory.getCurrentSession().delete(esameSostenuto);
    }

    //FILTER BY ID
    @Override
    public List showAllExamsByStudentId(int id){
        return sessionFactory.getCurrentSession()
                .createQuery("FROM EsameSostenuto ES WHERE ES.idStudente = :id_studente")
                .setParameter("id_studente", id)
                .list();
    }

    @Override
    public EsameSostenuto getEsameById(int id){
        logger.info("get esame by id :" + id);
        return (EsameSostenuto) sessionFactory.getCurrentSession()
                .get(EsameSostenuto.class, id);
    }
}
