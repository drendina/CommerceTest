package com.sopra.service;

import com.sopra.model.Studente;

import java.util.List;

public interface StudentService {

    List passingDataForQuery();
    Studente passingDataForQuery(int data);
    List passingDataForQuery(String data);
   void modifyStudent(Studente studente);
   Studente passingIdForDelete(int id);
   void insertNewStudent(String firstname, String lastname);

}
