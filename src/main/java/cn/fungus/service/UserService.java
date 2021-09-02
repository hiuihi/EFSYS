package cn.fungus.service;

import cn.fungus.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
//    public User findUser();

    /**
     * 根据用户id查询用户信息
     * @param userid
     * @return User
     */
    User selectUserByUid(Long userid);

    /**查询所有用户信息
     * @param
     * @return List<User>
     */
    List<User> selectAllUser(String userid ,String username, Integer start , Integer rows);
    /**
     * 查询所有用户数
     * @param
     * @return Integer
     */
    Integer selectCountUser(String userid ,String username);



    /**
     *
     * @param username
     * @return boolean
     */
    boolean checkUsername(String username);

    /**
     * 根据用户名查询用户
     * @param username
     * @return User
     */
    User selectUserByUsername(String username);

    boolean checkPhone(String phone);

    //登录
    User login(String username, String password);
    //注册
    void register(User user);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    void updateUserByUserId(User user);
    /**
     * 修改用户密码
     * @param user
     * @return
     */
    void updatePasswordByUserId(User user);
    /**
     * 修改用户头像
     * @param user
     * @return
     */
    void updateIconByUserId(User user);

    /**
     * 插入用户全部信息
     * @param user
     * @return
     */
    void insertUserAll(User user);
    /**
     * 修改用户全部信息
     * @param user
     * @return
     */
    void updateUserAllByUserId(User user);

    /**
     * 修改用户账号状态
     * @param id
     * @return
     */
    void updUserStatusById(Integer userStatus,Integer id);
    /**
     * 删除用户
     * @param id
     * @return
     */
    void delUserById(Integer id);
}
