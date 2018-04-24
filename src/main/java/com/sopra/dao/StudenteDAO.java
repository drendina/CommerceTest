package com.sopra.dao;

import com.sopra.model.Studente;

import java.util.List;

public interface StudenteDAO {

     List getAllStudentsHibernate();
     Studente getStudenteIdHibernate(int id);
     List getStudenteStringHibernate(String name);
     void modifyStudentHibernate(int id, String nome, String cognome);
     Studente deleteById(int id);
     void insertHibernate(String firstname, String lastname);
     void updateRecord(Studente studente);

}
