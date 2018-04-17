package com.sopra.service;

import com.sopra.model.Studente;

import java.util.LinkedList;
import java.util.List;

public interface StudentService {

    List<Studente> passingDataForQuery();
    Studente passingDataForQuery(int data);
    List<Studente> passingDataForQuery(String data);
}
