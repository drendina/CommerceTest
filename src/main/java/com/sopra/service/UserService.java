package com.sopra.service;


import com.sopra.form.UserForm;
import com.sopra.model.User;

public interface UserService {

    void registerNewUser(User user);
    User login(String email, String password);
}
