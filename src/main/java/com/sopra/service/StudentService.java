package com.sopra.service;

import com.sopra.model.Studente;

import java.util.List;

public interface StudentService {

    List getAllStudents();
    Studente getStudentById(int data);
    List filterByName(String data);
   void updateStudent(Studente studente);
   void deleteStudent(Studente studente);
   void insertStudent(Studente studente);

}
