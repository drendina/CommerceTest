package com.sopra.dao;

import java.util.List;

public interface MatterDAO  {
    List extractMatterList();
    List extractMatterListByName(String name);
    void insertMatterWithName(String name);
    void deleteMatter(int id);
}
