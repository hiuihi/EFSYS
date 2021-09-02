package cn.fungus.controller;

import cn.fungus.bean.ResponseResult;
import cn.fungus.domain.User;
import cn.fungus.service.UserService;
import cn.fungus.utils.Result;
import cn.hutool.core.util.IdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

    @Autowired
    private UserService userService;

    //显示登录界面
    @RequestMapping("/showLogin.do")
    public String showLogin(){
        return "front/login";
    }

    //显示注册界面
    @RequestMapping("/showRegister")
    public String showRegister(){
        return "front/register";
    }
    //显示忘记密码界面
    @RequestMapping("/showFPassword")
    public String showFPassword(){
        return "front/forgotPassword";
    }

    //根据用户名查询用户信息
    @RequestMapping("/selectUserByUsername")
    @ResponseBody
    public ResponseResult<User> selectUserByUsername(String username){
        ResponseResult<User> rr = new ResponseResult<User>();
        User user =userService.selectUserByUsername(username);
        if(user == null){
            rr.setState(0);
        }else{
            rr.setData(user);
            rr.setState(1);
        }
        return rr;
    }

    //验证用户id是否存在
    @RequestMapping("/checkUserid")
    @ResponseBody//相应json格式数据
    public ResponseResult<Void> checkUserid(String userid){
        //System.out.println("username:"+username);
        ResponseResult<Void> rr = new ResponseResult<Void>();
        User user = userService.selectUserByUid(Long.parseLong(userid));
        //System.out.println("b:"+b);
        if(user!=null){
            rr.setMessage("yes");
            rr.setState(0);
        }else{
            rr.setMessage("no");
            rr.setState(1);
        }
        return rr;

    }
    //验证用户名是否存在
    @RequestMapping("/checkUsername")
    @ResponseBody//相应json格式数据
    public ResponseResult<User> checkUsername(String username){
        //System.out.println("username:"+username);
        ResponseResult<User> rr = new ResponseResult<User>();
        boolean b = userService.checkUsername(username);


        //System.out.println("b:"+b);
        if(b){
            User user =userService.selectUserByUsername(username);
            rr.setData(user);
            rr.setMessage("yes");
            rr.setState(0);
        }else{
            rr.setMessage("no");
            rr.setState(1);
        }
        return rr;

    }

    //验证手机号码是否存在
    @RequestMapping("/checkPhone")
    @ResponseBody
    public ResponseResult<Void> checkPhone(String phone){
        ResponseResult<Void> rr = new ResponseResult<Void>();
        boolean b = userService.checkPhone(phone);

        if(b){
            rr.setMessage("yes");
            rr.setState(0);
        }else{
            rr.setMessage("no");
            rr.setState(1);
        }
        return rr;
    }

    //验证用户id,name,phone
    @RequestMapping("/checkUser")
    @ResponseBody
    public ResponseResult<String> checkUser(Long userid, String username, String phone,String upd){
        ResponseResult<String> rr = new ResponseResult<String>();
        User user = userService.selectUserByUid(userid);
        String str="存在";
        boolean ph = userService.checkPhone(phone);
        boolean un = userService.checkUsername(username);
        if (upd==null || upd==""){
            if(!ph && !un && user ==null){
                rr.setMessage("yes");
                rr.setState(0);
            }else{
                if (ph){
                    str="手机号  "+str;
                    rr.setMessage("no");
                }
                if (un){
                    str="用户名  "+str;
                    rr.setMessage("no");
                }
                if (user!=null){
                    str="ID  "+str;
                    rr.setMessage("no");
                }
            }
        }else{
            boolean nn=(user.getUsername().equals(username));
            boolean pp=(user.getPhone()==Long.parseLong(phone));
//            System.out.println("nn:"+nn+"  pp:"+pp);
            if ( ( nn && pp) || (!ph && !un) ){
                rr.setMessage("yes");
                rr.setState(0);
            }else{
                if (user.getUsername()!=username){
                    if (un){
                        str="用户名  "+str;
                        rr.setMessage("no");
                    }
                }
                if (user.getPhone()!=Long.parseLong(phone)){
                    if (ph){
                        str="手机号  "+str;
                        rr.setMessage("no");
                    }
                }
            }

        }
        rr.setData(str);
        return rr;
    }

    //登录
    @RequestMapping("/login")
    @ResponseBody
    public ResponseResult<Void> login(String username, String password,boolean checkboxNum, HttpSession session)  {
        ResponseResult<Void> rr=new ResponseResult<Void>();
            User user = userService.login(username, password);
//            System.out.println("cs:"+checkboxNum);
            if (user == null){
                rr.setState(0);
                rr.setMessage("登录失败！");

            }else{
                session.setAttribute("user",user);
                rr.setState(1);
                rr.setMessage("登录成功！");
            }
        return rr;
    }

    //注册
    @RequestMapping("/register")
    @ResponseBody
    public ResponseResult<Void> register(@RequestParam("Name")String username, String password, String phone,String securityQuestion,String answer,HttpSession session){
        ResponseResult<Void> rr = new ResponseResult<Void>();
        User user = new User(Long.parseLong(phone),username,password,Long.parseLong(phone),securityQuestion,answer);
        userService.register(user);
        User us=userService.selectUserByUid(Long.parseLong(phone));
        session.setAttribute("user",us);
        rr.setState(1);
        rr.setMessage("注册成功");
        return rr;
    }
    //更换头像
    @RequestMapping("/updIcon")
    @ResponseBody
    public Result updIcon(@RequestParam(value="file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request){
        //FIXME:此行改为所在工程的对应的上传物理路径
//        String uploadAbsolutePath = "D:\\Workspaces\\IdeaProjects\\EdibleFungusSMS\\src\\main\\webapp\\other\\img\\icon";
//        String uploadAbsolutePath = "D:\\Workspaces\\IdeaProjects\\EdibleFungusSMS\\src\\main\\webapp\\other\\img\\icon\\"+this.getId(session);
       // String path = request.getContextPath()+"/other/img/icon/"+this.getId(session);
        String  uploadAbsolutePath = request.getSession().getServletContext().getRealPath("/other/img/icon/")+this.getId(session);
        //System.out.println("pa:"+ uploadAbsolutePath);
        // 根据绝对路径在本地生成路径所需目录
        File file = new File(uploadAbsolutePath);

        if (!file.exists() && !file.mkdirs()) {
            // 如果file对象不存在，那么就将该对象的路径名中不存在的文件夹目录建立出来
            return Result.newFailureResult("文件上传路径不存在");
        }
        //原文件名
        String names = multipartFile.getOriginalFilename();
        // 文件扩展名
        String fileExt = names.substring(names.lastIndexOf(".") + 1).toLowerCase();

        // 文件上传后的新名
        String newName = IdUtil.simpleUUID() + "." + fileExt;
        User user = new User();
        String icon="/other/img/icon/"+this.getId(session)+ "/" +newName;
        user.setIcon(icon);
        user.setUserid(this.getId(session));
        // 文件的绝对路径File
        File uploadFile = new File(uploadAbsolutePath + "/" + newName);
        try {
            // 将上传的图片二进制流保存为文件
            FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadFile));
            userService.updateIconByUserId(user);
        } catch (IOException ioException) {
//            log.info("图片保存到文件夹中出错！");
            System.out.println("图片保存到文件夹中出错！");
            Result.newFailureResult("文件上传失败");
        } catch (Exception e) {
//            log.info("文件没有复制到指定的目录下");
            System.out.println("文件没有复制到指定的目录下");
        }
        Map<String, Object> result = new HashMap<>(2);
        result.put("oldName", names);
        result.put("newName", newName);
        //如果不使用封装返回方式，也可以直接返回map对象，可根据自己喜好和业务做修改
        return Result.newResult(1,"上传文件成功",result);

    }
    //更新用户信息
    @RequestMapping("/updUser")
    @ResponseBody
    public ResponseResult<Void> updUser( HttpSession session,String us) throws ParseException {
        ResponseResult<Void> rr = new ResponseResult<Void>();
        System.out.println("us:"+us);
        String[] split = us.split(",");
        for (String s:split){
//            System.out.println(s==null);
//            System.out.println(s.equals(""));
//            System.out.println("sq:"+s);
        }
        User user = new User(this.getId(session),split[0],split[1],split[2],Integer.parseInt(split[3]));
        System.out.println("1:"+user);
        userService.updateUserByUserId(user);
//        System.out.println("2");
        rr.setState(1);
        rr.setMessage("保存成功");
        return rr;
    }
    //修改密码
    @RequestMapping("/updPassword")
    @ResponseBody
    public ResponseResult<String> updPassword( HttpSession session,String pass) throws ParseException {
        ResponseResult<String> rr = new ResponseResult<String>();
       // System.out.println("us:"+pass);
        String[] split = pass.split(",");
        User user=userService.selectUserByUid(this.getId(session));
       if (!user.getPassword().equals(split[0])){
           rr.setState(0);
           rr.setMessage("旧密码不正确");
       }else if (!split[1].equals(split[2])){
           rr.setState(1);
           rr.setMessage("两次密码不相同");
       }else{
           User user1 = new User();
           user1.setUserid(this.getId(session));
           user1.setPassword(split[1]);
           //System.out.println("us:"+user);
           userService.updatePasswordByUserId(user1);
           //System.out.println("2");
           rr.setData(split[1]);
           rr.setState(2);
           rr.setMessage("修改成功");
       }
        return rr;
    }
    //找回密码
    @RequestMapping("/retrievePassword")
    @ResponseBody
    public ResponseResult<String> retrievePassword( String username,String password) throws ParseException {
        ResponseResult<String> rr = new ResponseResult<String>();
        User user=userService.selectUserByUsername(username);
        User user1 = new User();
        user1.setUserid(user.getUserid());
        user1.setPassword(password);
        userService.updatePasswordByUserId(user1);
//        rr.setData(split[1]);
        rr.setState(1);
        rr.setMessage("修改成功");
        return rr;
    }
}
