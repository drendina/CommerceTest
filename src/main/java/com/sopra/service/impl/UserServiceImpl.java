package com.sopra.service.impl;

import com.sopra.dao.UserDAO;
import com.sopra.form.UserForm;
import com.sopra.model.User;
import com.sopra.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    private static final Logger logger = Logger.getLogger(UserService.class);

    @Autowired
    private UserDAO userDao;

    @Override
    public void registerNewUser(User user) {
        logger.info("registerNewUser" + user);
        userDao.registerNewUser(user);
    }

    //SEARCH USER FOR LOGGING
    @Override
    public User login(String email, String password){
        return userDao.login(email, password);
    }
}
