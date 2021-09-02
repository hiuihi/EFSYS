package cn.fungus.service.impl;

import cn.fungus.bean.Message;
import cn.fungus.service.WSMessageService;
import cn.fungus.web.webSocket.Websocket;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("webSocketMessageService")
public class WSMessageServiceImpl implements WSMessageService {
    private Logger logger = LoggerFactory.getLogger(WSMessageServiceImpl.class);
    //声明websocket连接类
    private Websocket websocket = new Websocket();

    /**
     * @Title: sendToAllTerminal
     * @Description: 调用websocket类给用户下的所有终端发送消息
     * @param @param userId 用户id
     * @param @param message 消息
     * @param @return 发送成功返回true，否则返回false
     */
    @Override
    public Boolean sendToAllTerminal(Message message){
//        System.out.println("2:"+user);
        logger.debug("向用户{}的消息：{}",message.getId(),message.getMessageText());
        if(websocket.sendMessageToUser(message)){
            return true;
        }else{
            return false;
        }
    }
}
