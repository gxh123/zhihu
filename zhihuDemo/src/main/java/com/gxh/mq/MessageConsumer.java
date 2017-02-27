package com.gxh.mq;

import com.gxh.utils.JsonUtil;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class MessageConsumer implements InitializingBean, ApplicationContextAware{
    @Autowired
    private MessageQueue messageQueue;
    private ApplicationContext applicationContext;
    private ExecutorService threadPool;
    private Map<EventType, EventHandler> handlerMap = new HashMap<>();
    private volatile boolean close = false;

    @Override
    public void afterPropertiesSet() throws Exception {
        threadPool = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors()*5);
        Runtime.getRuntime().addShutdownHook(new Thread() {
            public void run() {
                close();
            }
        });

        Map<String, EventHandler> beans = applicationContext.getBeansOfType(EventHandler.class);

        if (beans != null) {
            for (Map.Entry<String, EventHandler> entry : beans.entrySet()) {
                EventType eventType = entry.getValue().getHandleType();
                if(!handlerMap.containsKey(eventType)){
                    handlerMap.put(eventType,entry.getValue());
                }
            }
        }

        new Thread(new Runnable() {
            @Override
            public void run() {
                while (!close) {
                    String message = messageQueue.askForMessage(5);  //5s
                    if (message == null) continue;

                    Event event = JsonUtil.fromJson(message, Event.class);
                    EventType type = event.getEventType();
                    if (!handlerMap.containsKey(type)) {
                        System.err.println("无法识别的事件类型");
                        continue;
                    }
                    threadPool.submit(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                handlerMap.get(type).handle(event);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    });
                }
            }
        }).start();
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }

    private void close(){
        threadPool.shutdown();
        close = true;
    }
}
