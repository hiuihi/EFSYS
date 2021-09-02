package cn.fungus.controller;

import cn.fungus.domain.User;
import cn.fungus.utils.KdApiOrderDistinguish;
import cn.fungus.utils.KdniaoTrackQueryAPI;
import cn.fungus.utils.Result;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



public class BaseController {
    /**
     *从session中获取登录时绑定的对象
     */
    //获取用户id
    Long getId(HttpSession session){
        User user=(User) session.getAttribute("user");
        if (user==null){
            return null;

        }else {
            return user.getUserid();
        }
    }
    //获取开关状态
    protected Integer getStatus(String status){
        if ("on".equals(status) || "1".equals(status)){
            return 1;
        }else{
            return 0;
        }
    }
    //判断是否为空
    protected boolean isNull(String str){
        if (str == null || "".equals(str) || str.length() == 0){
            return true;
        }else{
            return false;
        }

    }
    //调用接口查询物流
    protected List<String> getDelivery(String exp, String expNo){
        List<String> resultList = new ArrayList<String>();
        KdniaoTrackQueryAPI api = new KdniaoTrackQueryAPI();
        String expCode="";
        try {
            //第一个参数是快递公司简称（YD -- 韵达速递）
            //第二个参数是需要查询的快递单号
//            String result = api.getOrderTracesByJson("SF", "SF1198324912585");
//            String result = api.getOrderTracesByJson("HTKY", "552036450267052");
            expCode=getExpCode(exp);
//            expCode=getShipperCode(expNo);
            String result = api.getOrderTracesByJson(expCode, expNo);
            JSONObject jsonObject = JSONObject.fromObject(result);
            String ShipperCode = jsonObject.getString("ShipperCode");
            String LogisticCode = jsonObject.getString("LogisticCode");
            JSONArray Traces = jsonObject.getJSONArray("Traces");
            System.out.print(result+"\n");
//            System.out.println("快递名称"+ShipperCode);
//            System.out.println("快递单号"+LogisticCode);
            for(int i = 0; i < Traces.size(); i++) {
                JSONObject object = (JSONObject) Traces.get(i);
                String AcceptTime = object.getString("AcceptTime");
                String AcceptStation = object.getString("AcceptStation");
                System.out.println("时间："+AcceptTime+"\t"+AcceptStation);
                resultList.add(AcceptTime+"\t"+AcceptStation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultList;
    }
    //根据快递公司名字转换编码
    static String getExpCode(String exp){
         String expCode="";
         if ("圆通".equals(exp)||"圆通快递".equals(exp)||"圆通速递".equals(exp)){
            expCode="YTO";
         }else if ("申通".equals(exp)||"申通快递".equals(exp)||"申通速递".equals(exp)){
            expCode="STO";
        }else if ("百世".equals(exp)||"百世快递".equals(exp)){
            expCode="HTKY";
        }else if ("天天".equals(exp)||"天天快递".equals(exp)){
            expCode="HHTT";
        }
         return expCode;
    }
    String getShipperCode(String expNo){
        String expCode="";
        try {
            KdApiOrderDistinguish api = new KdApiOrderDistinguish();
            String result = api.orderOnlineByJson(expNo);
            JSONObject jsonObject = JSONObject.fromObject(result);
            JSONArray Shippers = jsonObject.getJSONArray("Shippers");
            for(int i = 0; i < Shippers.size(); i++) {
                JSONObject object = (JSONObject) Shippers.get(i);
                String ShipperCode = object.getString("ShipperCode");
                expCode=ShipperCode;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return expCode;
    }
    public static void main(String[] args) {

//        List<String> s=BaseController.getDelivery("圆通快递","YT5020096439652");
//        System.out.println("s:"+s);

    }
}
