package com.sopra.dao;

import com.sopra.model.EsameSostenuto;

import java.util.List;

public interface ExamDAO {
    List filterByName(String name);
    List showAllExams();
    void insertExam(EsameSostenuto esameSostenuto);
    List showAllExamsByStudentId(int id);
    EsameSostenuto getEsameById(int id);
    void deleteExam(EsameSostenuto esame);
}
