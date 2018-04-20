package com.sopra.dao;

import com.sopra.model.Studente;

import java.util.List;

public interface StudenteDAO {

     List<Studente> getAllStudentsHibernate();
     Studente getStudenteIdHibernate(int id);
     List<Studente> getStudenteStringHibernate(String name);
     void modifyStudentHibernate(int id, String nome, String cognome);
     Studente deleteById(int id);
}
