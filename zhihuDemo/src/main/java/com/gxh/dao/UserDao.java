package com.gxh.dao;

import com.gxh.model.User;

public interface UserDao {

    int deleteById(Integer id);

    int insert(User record);

    User selectById(long id);

    User selectByName(String name);

    User selectByPhone(String name);

    User selectByEmail(String name);

    int updateById(User record);
}
