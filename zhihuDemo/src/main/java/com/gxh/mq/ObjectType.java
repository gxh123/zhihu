package com.gxh.mq;

public enum ObjectType {

    QUESTION(0),     //问题
    ANSWER(1),       //答案
    TOPIC(2),        //话题
    COLLECTION(3),   //收藏
    USER(4);         //用户

    private int value;

    ObjectType(int value) {this.value = value;}

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        switch (value){
            case 0: return "question";
            case 1: return "answer";
            case 2: return "topic";
            case 3: return "collection";
            case 4: return "user";
        }
        return null;
    }
}
