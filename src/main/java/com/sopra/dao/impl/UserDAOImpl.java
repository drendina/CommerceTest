package com.sopra.dao.impl;

import com.sopra.dao.UserDAO;
import com.sopra.model.User;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private static final Logger logger = Logger.getLogger(UserDAO.class);

    //CREATE
    @Override
    public void registerNewUser(User user){
        logger.info("registerNewUser" + user);
        sessionFactory.getCurrentSession()
                .persist(user);
    }

    @Override
    public User login(String email, String password){
        logger.info("login");
        User user = (User) (sessionFactory.getCurrentSession()
                .createQuery("FROM User U WHERE U.email = :email AND U.password = :password")
                .setParameter("email", email)
                .setParameter("password", password)
                .list()).get(0);
        logger.info(user);

        return user;
    }

}
