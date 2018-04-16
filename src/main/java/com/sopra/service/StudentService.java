package com.sopra.service;

import com.sopra.model.Studente;

import java.util.LinkedList;

public interface StudentService {

    LinkedList<Studente> passingDataForQuery();
    Studente passingDataForQuery(int data);
    LinkedList<Studente> passingDataForQuery(String data);
}
