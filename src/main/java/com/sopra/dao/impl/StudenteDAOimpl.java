package com.sopra.dao.impl;

import com.sopra.dao.StudenteDAO;
import com.sopra.model.Studente;
import org.apache.log4j.Logger;
import org.hibernate.Query;
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

    @Override
    public List getAllStudentsHibernate() {
        return sessionFactory.getCurrentSession().createQuery("FROM Studente").list();
    }

    @Override
    public Studente getStudenteIdHibernate(int id) {
        logger.info(sessionFactory.getCurrentSession());
        return (Studente) sessionFactory.getCurrentSession().get(Studente.class, id);
    }

    @Override
    public List getStudenteStringHibernate(String name) {
        logger.info("get studente with name");
        return sessionFactory.getCurrentSession().createQuery
                ("FROM Studente S WHERE S.firstname = :studente_name").setParameter("studente_name", name).list();

    }

    public void modifyStudentHibernate(int id, String nome, String cognome) {
        logger.info("modify one student " + nome + ", " + cognome);

    }

    @Override
    public Studente deleteById(int id) {
        logger.info("Deleting...");
        String temp = "DELETE FROM Studente WHERE id = " + id;
        Query query = sessionFactory.getCurrentSession().createQuery(temp);
        logger.info(query);
        query.executeUpdate();
        return null;
    }

    @Override
    public void insertHibernate(String firstname, String lastname) {
        logger.info("Inserting...");
        Studente S = new Studente(firstname, lastname);
        sessionFactory.getCurrentSession().persist(S);
    }


    @Override
    public void updateRecord(Studente studente) {
    sessionFactory.getCurrentSession().update(studente);
    }
}
