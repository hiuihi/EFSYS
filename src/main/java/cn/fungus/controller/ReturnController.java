package cn.fungus.controller;

import cn.fungus.bean.AliReturnPayBean;
import cn.fungus.utils.JsonView;
import cn.fungus.utils.PayUtil;
import cn.hutool.core.util.IdUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author zdk
 * @date 2020/2/29 22:41
 */
@Controller
@RequestMapping("/returnPay")
public class ReturnController {

    private static Logger logger = LoggerFactory.getLogger(ReturnController.class);

    /**
     * 测试接口
     */

    @RequestMapping(value = "/testPay", method = RequestMethod.POST)
    @ResponseBody
    public String test(){
        String str = PayUtil.alipay(IdUtil.simpleUUID(), "18", IdUtil.simpleUUID(), "test");
        return new JsonView(0,str).toString();
    }

    /**
     * 测试接口
     */

    @RequestMapping(value = "/notifyUrl")
    @ResponseBody
    public String notifyUrl(){
        System.out.println("notifyUrl");
        return new JsonView(0).toString();
    }


    /**
     * 支付宝回调的接口
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/aliReturnPay")
    public void returnPay(HttpServletResponse response, AliReturnPayBean returnPay, HttpServletRequest req)
            throws IOException {
        response.setContentType("type=text/html;charset=UTF-8");
        System.out.println("支付宝的的回调函数被调用");
        logger.info("****************************************支付宝的的回调函数被调用******************************");
        if (!PayUtil.checkSign(req)) {
            logger.info("****************************************验签失败*******************************************");
            response.getWriter().write("failture");
            return;
        }
        if (returnPay == null) {
            logger.info("支付宝的returnPay返回为空");
            response.getWriter().write("success");
            return;
        }
        logger.info("支付宝的returnPay" + returnPay.toString());
        if (returnPay.getTrade_status().equals("TRADE_SUCCESS")) {
            logger.info("支付宝的支付状态为TRADE_SUCCESS");
            //业务逻辑处理
        }
        response.getWriter().write("success");
    }
}

