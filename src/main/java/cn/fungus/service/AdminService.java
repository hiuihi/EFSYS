package cn.fungus.service;

import cn.fungus.domain.Admin;

public interface AdminService {
    /**
     * 根据用户名查询用户信息
     * @param adminName
     * @return Admin
     */
    Admin selectAdminByAdminName(String adminName);

    Admin login(String adminName, String password);
}
