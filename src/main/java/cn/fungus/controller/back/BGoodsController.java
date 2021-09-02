package cn.fungus.controller.back;

import cn.fungus.bean.PageBean;
import cn.fungus.bean.ParseData;
import cn.fungus.bean.ResponseResult;
import cn.fungus.controller.BaseController;
import cn.fungus.domain.Goods;
import cn.fungus.domain.User;
import cn.fungus.service.GoodsService;
import cn.fungus.utils.RandomNumberGenerator;
import cn.fungus.utils.Result;
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
import java.util.ArrayList;
import java.util.List;

/**
 * @author MAC
 */
@Controller
@RequestMapping("/bgoods")
public class BGoodsController extends BaseController {

    @Autowired
    private GoodsService goodsService;


    //显示商品
    @RequestMapping("showGoods.action")
    public String showGoods(ModelMap modelMap, HttpSession session,HttpServletRequest request){
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
        String gid=request.getParameter("gid");
        String gname=request.getParameter("gname");
        if(start==null || "".equals(start)){
            start="0";
        }
        if(rows==null || "".equals(rows)){
            rows="5";
        }
        if (currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }else{
            start=""+Integer.parseInt(rows)*(Integer.parseInt(currentPage)-1);
        }
        request.setAttribute("gid",gid);
        request.setAttribute("gname",gname);
        if (isNull(gid)){
            gid="%"+""+"%";
        }else{
            gid="%"+gid+"%";
        }
        if (isNull(gname)){
            gname="%"+""+"%";
        }else{
            gname="%"+gname+"%";
        }
        //总记录数
        Integer totalCount=goodsService.selectCountGoods(gid,gname);
        //总页数
        Long row=Long.parseLong(rows);
        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;
        List<Goods> goodss = goodsService.selectAllGoods(gid,gname,Integer.parseInt(start),Integer.parseInt(rows));
        PageBean pageBean=new PageBean(totalCount.longValue(),totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows));

        request.setAttribute("goodss",goodss);
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("pageBean",pageBean);
//        request.setAttribute("condition",condition);
        return "back/goods";
    }
    //显示库存预警
    @RequestMapping("showInventory.action")
    public String showInventory(ModelMap modelMap, HttpSession session,HttpServletRequest request){
        String start=request.getParameter("start");
        String rows=request.getParameter("rows");
        String currentPage=request.getParameter("currentPage");
//        String orderStatus=request.getParameter("orderStatus");
        String condition=request.getParameter("condition");
        if(start==null || "".equals(start)){
            start="0";
        }
        if(rows==null || "".equals(rows)){
            rows="5";
        }
        if (currentPage==null || "".equals(currentPage)){
            currentPage="1";
        }else{
            start=""+Integer.parseInt(rows)*(Integer.parseInt(currentPage)-1);
        }
//        if (orderStatus==null || "".equals(orderStatus)){
//            orderStatus="%"+""+"%";
//        }else{
//            orderStatus="%"+orderStatus+"%";
//        }
        if (condition==null || "".equals(condition)){
            condition="0";
        }
        Integer totalCount=0;
        List<Goods> goodss = goodsService.selectGoodsNoPagination();
        List<Goods> goodses = new ArrayList<Goods>();
        List<Goods> goodsess = new ArrayList<Goods>();

        for (Goods good : goodss){
            if (good.getLowStock()>good.getStock()){
//                System.out.println("goods:"+good.getGoodsName()+good.getStock()+":0l:"+good.getLowStock());
                goodses.add(good);
            }
        }
        totalCount=goodses.size();
//        System.out.println("s:"+Integer.parseInt(start)+"sss:"+(Integer.parseInt(start)+Integer.parseInt(rows)));
        int len=Integer.parseInt(start)+Integer.parseInt(rows);
        if (len>totalCount){
            len=totalCount;
        }
        for (int i=Integer.parseInt(start);i<len;i++){
            goodsess.add(goodses.get(i));
        }

//        System.out.println("gs:"+goodses);
//        System.out.println("ta:"+totalCount);
        //总记录数
//        Integer totalCount=goodsService.selectCountGoods();
        //总页数
        Long row=Long.parseLong(rows);
        Long totalPage=(totalCount % row)==0?totalCount/row:(totalCount/row)+1;

        PageBean pageBean=new PageBean(totalCount.longValue(),totalPage,Integer.valueOf(currentPage),Integer.valueOf(rows));

        request.setAttribute("goodss",goodsess);
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("condition",condition);
        return "back/inventory";
    }

    //查询商品，根据gid
    @RequestMapping("/selectGoods")
    @ResponseBody
    public ResponseResult<Goods> selectGoods(Integer gid)  {
        ResponseResult<Goods> rr=new ResponseResult<Goods>();
        Goods goods=goodsService.selectGoodsByGid(gid,1);
        rr.setData(goods);
        rr.setState(1);
//        Integer count=userService.selectCountUser();
        return rr;
    }
    //插入商品
    @RequestMapping("/insertGoods")
    @ResponseBody
    public ModelAndView insertGoods(Integer goodsId, String goodsName, String title, String icon, String pic, String subPic, String simpleDesc, Double price, String spec, Integer stock, Integer lowStock, String unit, Double weight, Integer categoryId, String albumPics, String description, String publishStatus, String newStatus, String recommandStatus, String discountStatus, Double promotionPrice, Integer promotionPerLimit, String promotionTime) throws ParseException {
//        System.out.println("goodsId"+goodsId+",goodsName:"+goodsName+",title:"+title+",icon:"+ icon+",pic:"+ pic+",subPic:"+ subPic+",simpleDesc:" +simpleDesc+",price:"+ price+",spec:"+ spec+",stock:" +stock+",lowStock:"+ lowStock+",unit:"+ unit+",weight:" +weight+",categoryId:"+ categoryId+",albumPics:"+ albumPics+",description:"+ description+",publishStatus:"+ publishStatus+",newStatus:"+ newStatus+",recommandStatus:"+ recommandStatus+",discountStatus:"+ discountStatus+",promotionPrice:"+ promotionPrice+",promotionPerLimit:"+ promotionPerLimit+",promotionTime:" +promotionTime);
//        System.out.println("publishStatus:"+this.getStatus(publishStatus)+"：newStatus:"+this.getStatus(newStatus)+":recommandStatus:"+this.getStatus(recommandStatus)+":discountStatus:"+this.getStatus(discountStatus));
        String promotionStartTime = "";
        String promotionEndTime="";
        if (promotionTime!=null && promotionTime!=""){
            promotionStartTime = promotionTime.substring(0,19);
            promotionEndTime=promotionTime.substring(22);
        }
        String specc="";
        if (spec!=null || !"".equals(spec)){
            for (int i=0;i<spec.length();i++){
                String sp = spec.substring(i,i+1)+",";
                specc+=sp;
            }
            specc=specc.substring(0,specc.length() - 1);
        }
//        System.out.println("StartTime"+promotionStartTime+"：EndTime"+promotionEndTime+"：promotionTime"+promotionTime);
        Goods goods=new Goods(goodsId,goodsName,icon,pic,subPic,title,simpleDesc,price,stock,lowStock,specc,unit,weight,description,albumPics,promotionPrice,promotionStartTime,promotionEndTime,promotionPerLimit,this.getStatus(publishStatus),this.getStatus(newStatus),this.getStatus(recommandStatus),this.getStatus(discountStatus),categoryId);
        goodsService.insertGoodsAll(goods);
        return new ModelAndView("redirect:showGoods.action");
    }


    //修改商品
    @RequestMapping("/updGoods")
    @ResponseBody
    public ModelAndView updGoods(Integer goodsId, String goodsName, String title, String icon, String pic, String subPic, String simpleDesc, Double price, String spec, Integer stock, Integer lowStock, String unit, Double weight, Integer categoryId, String albumPics, String description, String publishStatus, String newStatus, String recommandStatus, String discountStatus, Double promotionPrice, Integer promotionPerLimit, String promotionTime) throws ParseException {
        String promotionStartTime = "";
        String promotionEndTime="";
        if (promotionTime!=null && promotionTime!=""){
            promotionStartTime = promotionTime.substring(0,19);
            promotionEndTime=promotionTime.substring(22);
        }
        Goods goods=new Goods(goodsId,goodsName,icon,pic,subPic,title,simpleDesc,price,stock,lowStock,spec,unit,weight,description,albumPics,promotionPrice,promotionStartTime,promotionEndTime,promotionPerLimit,this.getStatus(publishStatus),this.getStatus(newStatus),this.getStatus(recommandStatus),this.getStatus(discountStatus),categoryId);
        goodsService.updateGoodsAll(goods);
        return new ModelAndView("redirect:showGoods.action");
    }
    //删除商品
    @RequestMapping("/delGoods")
    @ResponseBody
    public ParseData<Goods>  delGoods(String ids)  {
        ParseData<Goods> pd=new ParseData<Goods>();
        String[] split = ids.split(",");
        for (String id : split){
            goodsService.delGoodsById(Integer.parseInt(id));
        }
        pd.setCode(0);
        return pd;
    }
    //验证gid是否存在
    @RequestMapping("/checkGoodsId")
    @ResponseBody
    public ResponseResult<String> checkGoodsId(Integer goodsId,Integer oldGoodsId){
        ResponseResult<String> rr = new ResponseResult<String>();
        Goods goods=goodsService.selectGoodsByGid(goodsId,1);
        String str="";
        if(goods==null){
            rr.setMessage("yes");
            rr.setState(0);
        }else{
            if (oldGoodsId==null){
                str="ID存在";
                rr.setMessage("no");
                rr.setState(1);
            }else{
                boolean gg=goods.getGoodsId().equals(oldGoodsId);
                if (!gg){
                    str="ID存在";
                    rr.setMessage("no");
                    rr.setState(1);
                }else{
                    rr.setMessage("yes");
                    rr.setState(0);
                }
            }

        }
        rr.setData(str);
        return rr;
    }
    //修改账号状态
    @RequestMapping("/updStatus")
    @ResponseBody
    public ParseData<User> updUserStatus(Integer id, Integer status,String st)  {
        ParseData<User> pd=new ParseData<User>();
        //System.out.println("id:"+id+"   uss:"+userStatus);
//        userService.updUserStatusById(Integer.parseInt(userStatus),Integer.parseInt(id));
        Goods goods=new Goods();
        goods.setId(id);
        switch(st){
            case "P":
                goods.setPublishStatus(status);
                goodsService.updPubStatusById(goods);
                break;
            case "N":
                goods.setNewStatus(status);
                goodsService.updNewStatusById(goods);
                break;
            case "R":
                goods.setRecommandStatus(status);
                goodsService.updRecStatusById(goods);
                break;
            case "D":
                goods.setDiscountStatus(status);
                goodsService.updDisStatusById(goods);
                break;
            default:
                pd.setCode(1);
                break;

        }
        pd.setCode(0);
        return pd;
    }
    //更换图片
    @RequestMapping("/updIcon")
    @ResponseBody
    public Result updIcon(@RequestParam(value="file") MultipartFile multipartFile, HttpSession session, HttpServletRequest request,String goodsId,String folder){
//        String folder=IdUtil.simpleUUID();
//        String folder="1";
        String  uploadAbsolutePath = request.getSession().getServletContext().getRealPath("/other/img/product/")+goodsId+"/"+folder;
        File file = new File(uploadAbsolutePath);
        //System.out.println("user:"+userid);
        if (!file.exists() && !file.mkdirs()) {
            // 如果file对象不存在，那么就将该对象的路径名中不存在的文件夹目录建立出来
            return Result.newFailureResult("文件上传路径不存在");
        }
        //原文件名
        String names = multipartFile.getOriginalFilename();
        System.out.println("name:"+names);
        // 文件扩展名
        String fileExt = names.substring(names.lastIndexOf(".") + 1).toLowerCase();
        // 文件上传后的新名
        String newName = RandomNumberGenerator.generateNumber()+ "." + fileExt;
        String icon="/other/img/product/"+goodsId+"/"+folder+ "/" +newName;
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
//        return Result.newResult(0,"上传文件成功",icon);
        return Result.newResult(0,"",icon);
    }



}
