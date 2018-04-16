package com.sopra.dao;

import com.sopra.model.Studente;

import java.util.List;

public interface StudenteDAO {

     List<Studente> selectAll();
     Studente selectById(int id);
     List<Studente> selectByFirstname(String nome);
     List<Studente> getStudentList(String nome);
     List<Studente> getAllStudents();
}
