package com.sopra.service;

import com.sopra.model.EsameSostenuto;

import java.util.List;

public interface ExamService {
    List filterByName(String name);
    List showAllExams();
    void insertExam(EsameSostenuto esameSostenuto);
    List showAllExamsByStudentId(int id);
}
