package com.gxh.model;

import org.springframework.stereotype.Component;

@Component
public class UserHolder {

    private static ThreadLocal<User> user = new ThreadLocal<User>();

    public User getUser()
    {
        return user.get();
    }

    public void setUser(User user)
    {
        this.user.set(user);
    }

    public void clear() {
        user.remove();
    }

}
