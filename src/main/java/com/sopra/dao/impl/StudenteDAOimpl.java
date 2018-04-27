package com.sopra.dao.impl;

import com.sopra.dao.StudenteDAO;
import com.sopra.model.Studente;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;



@Repository
@Transactional
public class StudenteDAOimpl implements StudenteDAO {
    @Autowired
    private SessionFactory sessionFactory;
    private static final Logger logger = Logger.getLogger(StudenteDAOimpl.class);

    //CREATE
    @Override
    public void insertStudent(Studente studente) {
        logger.info("Inserting student " + studente);
        sessionFactory.getCurrentSession()
                .persist(studente);
    }

    //READ
    @Override
    public List getAllStudents() {
        logger.info("Get all students");
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Studente")
                .list();
    }

    //UPDATE
    @Override
    public void updateStudent(Studente studente) {
        logger.info("Updating student " + studente);
        sessionFactory.getCurrentSession()
                .update(studente);
    }

    //DELETE
    @Override
    public void deleteStudent(Studente studente) {
        logger.info("Deleting student " + studente);
        sessionFactory.getCurrentSession()
                .delete(studente);
    }

    //SEARCH BY ID
    @Override
    public Studente getStudentById(int id) {
        logger.info(sessionFactory.getCurrentSession());
        return (Studente) sessionFactory.getCurrentSession()
                .get(Studente.class, id);
    }

    //FILTER BY NAME
    @Override
    public List filterByName(String name) {
        logger.info("Get students by name");
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Studente S WHERE S.firstname = :studente_name")
                .setParameter("studente_name", name)
                .list();
    }
}
