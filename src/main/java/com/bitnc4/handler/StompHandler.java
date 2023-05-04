package com.bitnc4.handler;


import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.ChannelInterceptorAdapter;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class StompHandler implements ChannelInterceptor{

    @Override
    public void postSend(Message<?> message, MessageChannel channel, boolean sent) {
        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        //String sessionId = accessor.getSessionId();
        switch(accessor.getCommand()){
            case CONNECT:
                //유저가 소켓 connect를 한 뒤
                log.info("연결 : " + accessor.getSessionId());
                log.info(message.getPayload().toString());
                break;
            case DISCONNECT:
                //유저가 disconnect(호출 및 끊김)시
                log.info("종료 : " + accessor.getSessionId());
                log.info(message.getPayload().toString());
                break;
            default:
                break;
        }
    }
}
