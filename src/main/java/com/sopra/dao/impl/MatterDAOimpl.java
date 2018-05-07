package com.sopra.dao.impl;

import com.sopra.dao.MatterDAO;
import com.sopra.model.Materia;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class MatterDAOimpl implements MatterDAO {
    @Autowired
    private SessionFactory sessionFactory;
    private static final Logger logger = Logger.getLogger(MatterDAOimpl.class);


    @Override
    public List extractMatterList(){
        logger.info("extract all matters");
        logger.info(sessionFactory.getCurrentSession().createQuery("FROM Materia").list());
        return sessionFactory.getCurrentSession().createQuery("FROM Materia").list();
    }

    @Override
    public List extractMatterListByName(String name){
        logger.info("extract matters by name");
        return sessionFactory.getCurrentSession().createQuery
                ("FROM Materia E WHERE E.nomeEsame = :nome_esame").
                setParameter("nome_esame",name).list();
    }

    @Override
    public void insertMatterWithName(String name){
        logger.info("Insert matter with name");
        Materia E = new Materia(name);
        sessionFactory.getCurrentSession().persist(E);
    }
}
