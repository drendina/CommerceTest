package com.sopra.dao;

import com.sopra.model.User;

public interface UserDAO {
    void registerNewUser(User user);
    User login(String email, String password);
}
