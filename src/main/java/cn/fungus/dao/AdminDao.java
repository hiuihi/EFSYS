package cn.fungus.dao;

import cn.fungus.domain.Admin;

public interface AdminDao {

    /**
     * 根据用户名查询用户信息
     * @param adminName
     * @return Admin
     */
    Admin selectAdminByAdminName(String adminName);

}
