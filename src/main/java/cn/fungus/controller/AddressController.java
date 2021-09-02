package cn.fungus.controller;

import cn.fungus.bean.ResponseResult;
import cn.fungus.domain.Address;
import cn.fungus.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("address")
public class AddressController extends BaseController{

   @Autowired
    private AddressService addressService;

    /**
     * 添加地址数据
     * @param
     * @return
     */
    @RequestMapping("addAddress")
    @ResponseBody
    public ResponseResult<Void> addAddress(HttpSession session,String address){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        String[] add = address.split(",");
        Address addres=new Address(this.getId(session),add[0],add[1],add[2],add[3],add[4],add[5],Integer.parseInt(add[6]));
        addressService.addAddress(addres);
        rr.setState(1);
        rr.setMessage("添加成功！");
        return rr;
    }
    /**
     * 修改默认地址
     * @param
     * @return
     */
    @RequestMapping("updateDefaultAddress")
    @ResponseBody
    public ResponseResult<Void> updateDefaultAddress(HttpSession session,Long id){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        addressService.updateDefaultAddress();
        addressService.updateDefaultAddressById(id);
        rr.setState(1);
        rr.setMessage("修改成功！");
        return rr;
    }
    /**
     * 根据id修改地址
     * @param
     * @return
     */
    @RequestMapping("updateAddress")
    @ResponseBody
    public ResponseResult<Void> updateAddressById(HttpSession session,String address){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        System.out.println("up:"+address);
        String[] add = address.split(",");
        if (Integer.parseInt(add[7])==1){
            System.out.println("qian");
            addressService.updateDefaultAddress();
//            addressService.updateDefaultAddressById(Long.parseLong(add[0]));
            System.out.println("hou");
        }
        Address addres=new Address(Long.parseLong(add[0]),add[1],add[2],add[3],add[4],add[5],add[6],Integer.parseInt(add[7]),0);
        //System.out.println(addres);
        System.out.println("11");
        addressService.updateAddressById(addres);
        System.out.println("22");
        rr.setState(1);
        rr.setMessage("修改成功！");
        return rr;
    }


    // 删除购物车商品
    @RequestMapping("delAddress")
    @ResponseBody
    public ResponseResult<Void> delAddress(HttpSession session,Long id){
        ResponseResult<Void> rr=new ResponseResult<Void>();
        addressService.deleteAddressById(id);
        rr.setState(1);
        rr.setMessage("删除成功！");
        return rr;
    }

}

