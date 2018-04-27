package com.sopra.dao;

import com.sopra.model.Studente;

import java.util.List;

public interface StudenteDAO {

     List getAllStudents();
     Studente getStudentById(int id);
     List filterByName(String name);
     void deleteStudent(Studente studente);
     void insertStudent(Studente studente);
     void updateStudent(Studente studente);

}
