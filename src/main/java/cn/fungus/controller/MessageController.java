package cn.fungus.controller;

import cn.fungus.bean.Message;
import cn.fungus.domain.User;
import cn.fungus.service.UserService;
import cn.fungus.service.WSMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("message")
public class MessageController {

    @Autowired
    private WSMessageService wsMessageService;

    @Autowired
    private UserService userService;

    private Logger logger = LoggerFactory.getLogger(MessageController.class);

    //请求入口
    @RequestMapping(value="/TestWS",method= RequestMethod.GET)
    @ResponseBody
    public String TestWS(@RequestParam(value="userId") Long userId,
                         @RequestParam(value="message") String message,@RequestParam(value="uid") String uid){
        Message message1;
        if (uid==null || "".equals(uid)){
            User user=userService.selectUserByUid(userId);
            message1=new  Message(userId,message,user);
        }else{
            User user=userService.selectUserByUid(Long.parseLong(uid));
            message1=new  Message(userId,uid,message,user);
        }

        logger.warn("收到发送请求，向用户{}的消息：{}",userId,message);
//        User user=userService.selectUserByUid(userId);
//        System.out.println("1:"+user);
        if(wsMessageService.sendToAllTerminal(message1)){
            return "success";
        }else{

            return "error";
        }
    }
}
