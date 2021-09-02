package cn.fungus.service;

import cn.fungus.bean.Message;

public interface WSMessageService {
     Boolean sendToAllTerminal(Message message);
}
