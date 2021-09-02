package cn.fungus.controller.back;

import cn.fungus.bean.PageBean;
import cn.fungus.bean.ParseData;
import cn.fungus.controller.BaseController;
import cn.fungus.domain.User;
import cn.fungus.service.UserService;
import cn.fungus.utils.Result;
import cn.hutool.core.util.IdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;


/**
 * @author MAC
 */
@Controller
@RequestMapping("/buser")
public class BUserController extends BaseController {

    @Autowired
    private UserService userService;

    //显示用户
    @RequestMapping("/showUser.action")
    public String showUser(ModelMap modelMap, HttpSession session, HttpServletRequest request){
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
        String uid=request.getParameter("uid");
        String uname=request.getParameter("uname");
        if(start==null || "".equals(start)){
            start="0";
        }
        if(rows==null || "".equals(rows)){
            rows="6";
        }
        if (currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }else{
            start=""+Integer.parseInt(rows)*(Integer.parseInt(currentPage)-1);
        }
        request.setAttribute("uname",uname);
        request.setAttribute("uid",uid);
        if (isNull(uname)){
            uname="%"+""+"%";
        }else{
            uname="%"+uname+"%";
        }
        if (isNull(uid)){
            uid="%"+""+"%";
        }else{
            uid="%"+uid+"%";
        }
        //总记录数
        Integer totalCount=userService.selectCountUser(uid,uname);
        //总页数
        Long row=Long.parseLong(rows);
        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;
        List<User> users = userService.selectAllUser(uid,uname,Integer.parseInt(start),Integer.parseInt(rows));
        PageBean pageBean=new PageBean(totalCount.longValue(),totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows));
        System.out.println("uL:"+users);
        request.setAttribute("users",users);
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("pageBean",pageBean);
        return "back/user";
    }
    //添加用户
    @RequestMapping("/addUser")
    public ModelAndView addUser(Long userid, String username, String password, String nickname, Long phone, String close, String icon, Integer sex, String birthday, String city, String job) throws ParseException {
        System.out.println("id:"+userid+"，username："+username+"，passwor："+password+"，nickname："+nickname+"，phone："+phone+"，close："+close+"，icon："+icon+"，sex："+sex+"，city："+city+"，job："+job);
        Integer userStatus=0;
        if ("on".equals(close)){
            userStatus=1;
        }
//        if (birthday==""){
//            birthday=null;
//        }
        System.out.println("us:"+userStatus+"   ba:"+birthday);
        User user=new User(userid,username,password,nickname,phone,userStatus,icon,sex,birthday,city,job);
        userService.insertUserAll(user);
        return new ModelAndView("redirect:showUser.action");
    }
    //修改用户
    @RequestMapping("/updUser")
    public ModelAndView updUser(HttpServletRequest request,Long userid,String username,String password,String nickname,Long phone,String close,String icon,Integer sex,String birthday,String city,String job) throws ParseException {

       // System.out.println("id:"+userid+"，username："+username+"，passwor："+password+"，nickname："+nickname+"，phone："+phone+"，close："+close+"，createTime："+createTime+"，icon："+icon+"，sex："+sex+"，city："+city+"，job："+job);
        Integer userStatus=0;
        if ("on".equals(close)){
            userStatus=1;
        }
//        System.out.println("us:"+userStatus+"   ba:"+birthday);
//        this.updicon(request,icon,userid);
        User user=new User(userid,username,password,nickname,phone,userStatus,icon,sex,birthday,city,job);
        userService.updateUserAllByUserId(user);
//        System.out.println("成功");
        return new ModelAndView("redirect:showUser.action");
    }
    //删除用户
    @RequestMapping("/delUser")
    @ResponseBody
    public ParseData<User> delUser(String ids, boolean checkboxNum, HttpSession session)  {
        ParseData<User> pd=new ParseData<User>();
        String[] split = ids.split(",");
        for (String id : split){
            userService.delUserById(Integer.parseInt(id));
        }
        pd.setCode(0);
        return pd;
    }
    //修改账号状态
    @RequestMapping("/updUserStatus")
    @ResponseBody
    public ParseData<User> updUserStatus(String id, String userStatus, HttpSession session)  {
        ParseData<User> pd=new ParseData<User>();
        //System.out.println("id:"+id+"   uss:"+userStatus);
        userService.updUserStatusById(Integer.parseInt(userStatus),Integer.parseInt(id));
        pd.setCode(0);
        return pd;
    }


    //更换头像
    @RequestMapping("/updIcon")
    @ResponseBody
    public Result updIcon(@RequestParam(value="file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request,String userid){
        String  uploadAbsolutePath = request.getSession().getServletContext().getRealPath("/other/img/icon/")+userid;
        File file = new File(uploadAbsolutePath);
        //System.out.println("user:"+userid);
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
        String icon="/other/img/icon/"+userid+ "/" +newName;
        //文件的绝对路径File
        File uploadFile = new File(uploadAbsolutePath + "/" + newName);
        try {
            // 将上传的图片二进制流保存为文件
            FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadFile));
        } catch (IOException ioException) {
            System.out.println("图片保存到文件夹中出错！");
            Result.newFailureResult("文件上传失败");
        } catch (Exception e) {
            System.out.println("文件没有复制到指定的目录下");
        }
//        Map<String, Object> result = new HashMap<>(3);
//        result.put("oldName", names);
//        result.put("newName", newName);
        //如果不使用封装返回方式，也可以直接返回map对象，可根据自己喜好和业务做修改
        return Result.newResult(0,"上传文件成功",icon);
    }


}
