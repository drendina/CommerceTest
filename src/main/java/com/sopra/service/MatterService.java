package com.sopra.service;

import java.util.List;

public interface MatterService {
    List getMatterList();
    List mattersByName(String name);
    void insertMatter(String name);
}
