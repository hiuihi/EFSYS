package cn.fungus.service.impl;

import cn.fungus.dao.AdminDao;
import cn.fungus.domain.Admin;
import cn.fungus.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;


    //登录
    @Override
    public Admin login(String adminName, String password) {
        Admin admin=adminDao.selectAdminByAdminName(adminName);
//        User user =userDao.selectByUsername(username);
        boolean is=false;
        if (admin!=null){
            if (admin.getAdminStatus()==1){
                boolean a=admin.getPassword().equals(password);
                if (a){
                    is=true;
                }
            }
        }
        if (is){
            return admin;
        }else{
            return null;
        }
    }

    /**
     * 根据用户名查询用户信息
     * @param adminName
     * @return Admin
     */
    @Override
    public Admin selectAdminByAdminName(String adminName) {
        return adminDao.selectAdminByAdminName(adminName);
    }
}
