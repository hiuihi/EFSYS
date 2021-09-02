package cn.fungus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class Test {

    @RequestMapping("/1")
    public String test(){
        return "test/1";
    }
    @RequestMapping("/2")
    public String test1(){
        return "test/2";
    }
}
