package cn.fungus.dao;

import cn.fungus.domain.User;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface UserDao {
    
    //User findUser();


    /**
     * 根据用户id查询用户信息
     * @param userid
     * @return User
     */
    User selectUserByUid(Long userid);

    /**
     * 根据用户名查询用户信息
     * @param username
     * @return User
     */
    User selectByUsername(String username);

    /**
     * 查询所有用户数
     * @param
     * @return Integer
     */
    Integer selectCountUser(@Param("userid") String userid , @Param("username")String username);

    /**查询所有用户信息
     * @param
     * @return List<User>
     */
    List<User> selectAllUser(@Param("userid") String userid , @Param("username")String username,@Param("start") Integer start , @Param("rows")Integer rows);


//    //根据用户名查询用户信息
//    User login(String username,String password);
    /**
     * 插入用户
     * @param user
     * @return 
     */
    void insertUser(User user);
    /**
     * 修改用户信息（别名，性别，生日，城市）
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

    Integer selectByPhone(String phone);
    /**
     * 插入用户全部信息
     * @param user
     * @return
     */
    void insertUserAll(User user);
    /**
     * 插入用户全部信息(无头像)
     * @param user
     * @return
     */
    void insertUserAllNoIcon(User user);
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
    void updUserStatusById(@Param("userStatus") Integer userStatus,@Param("id")Integer id);
    /**
     * 删除用户
     * @param id
     * @return
     */
    void delUserById(Integer id);
}
