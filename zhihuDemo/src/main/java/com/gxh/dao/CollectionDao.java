package com.gxh.dao;

import com.gxh.model.OneCollection;

public interface CollectionDao{

    int addCollection(OneCollection collection);

    OneCollection getCollectionById(long id);

}
