package com.gxh.mq;

public enum EventType {

    FOLLOW(0),   //关注
    UNFOLLOW(1), //取关
    THANK(2),    //感谢
    COMMENT(3),  //评论
    ANSWER(4),   //回答
    AGREE(5),    //赞同
    DISAGREE(6), //反对
    CANCEL_AGREE(7),    //取消赞同
    CANCEL_DISAGREE(8), //取消反对
    CANCEL_THANK(9);    //取消感谢


    private int value;

    EventType(int value) {this.value = value;}

    public int getValue() {
        return value;
    }

}
