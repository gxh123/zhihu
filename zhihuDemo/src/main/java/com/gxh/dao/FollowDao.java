package com.gxh.dao;

import com.gxh.model.Follow;
import com.gxh.model.User;
import com.gxh.mq.ObjectType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FollowDao {

    void addFollow(Follow follow);

    void removeFollow(Follow follow);

//    List<User> getFollowers(long targetId);

//    List<User> getFollowings(long id);

    List<Long> getFollowersIds(@Param("objectId") long objectId, @Param("objectType")int objectType);

    List<Long> getFollowingsIds(@Param("userId")long userId, @Param("objectType")int objectType);
}
