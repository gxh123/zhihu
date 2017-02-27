package com.gxh.service;

import com.gxh.dao.CollectionDao;
import com.gxh.model.OneCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollectionService {
    @Autowired
    CollectionDao collectionDao;

    public OneCollection getById(long id) {
        return collectionDao.getCollectionById(id);
    }

    public int addAnswer(OneCollection collection) {
        return collectionDao.addCollection(collection);
    }
}
