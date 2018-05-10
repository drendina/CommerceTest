package com.sopra.service;

import java.util.List;

public interface MatterService {
    List getMatterList();
    void insertMatter(String name);
    void deleteMatter(int id);
}
