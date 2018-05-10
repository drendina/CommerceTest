package com.sopra.service.impl;

import com.sopra.dao.MatterDAO;
import com.sopra.service.MatterService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class MatterServiceImpl implements MatterService {

    @Autowired
    private MatterDAO matterDAO;
    private static final Logger logger = Logger.getLogger(MatterServiceImpl.class);

    @Override
    public List getMatterList(){
        logger.info("passing: extract all matters");
        return matterDAO.extractMatterList();
    }

    @Override
    public void insertMatter(String name){
        matterDAO.insertMatterWithName(name);
    }

    @Override
    public void deleteMatter(int id) {
        matterDAO.deleteMatter(id);
    }
}
