package cn.fungus.service.impl;

import cn.fungus.dao.UserDao;
import cn.fungus.domain.User;
import cn.fungus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

//    @Override
//    public User findUser() {
//        return null;
//    }


    /**
     * 根据用户id查询用户信息
     * @param userid
     * @return User
     */
    @Override
    public User selectUserByUid(Long userid) {
        return userDao.selectUserByUid(userid);
    }

    /**查询所有用户信息
     * @param
     * @return List<User>
     */
    @Override
    public List<User> selectAllUser(String userid ,String username,Integer start ,Integer rows) {
        return userDao.selectAllUser(userid,username,start,rows);
    }
    /**
     * 查询所有用户数
     * @param
     * @return Integer
     */
    @Override
    public Integer selectCountUser(String userid ,String username) {
        return userDao.selectCountUser(userid, username);
    }

    //根据用户名查询用户信息
    @Override
    public boolean checkUsername(String username) {
        User user =userDao.selectByUsername(username);
        if (user==null){
            return false;
        }else{
            return true;
        }
    }
    /**
     * 根据用户名查询用户信息
     * @param username
     * @return Integer
     */
    @Override
    public User selectUserByUsername(String username) {
        User user =userDao.selectByUsername(username);
        boolean is=false;
        if (user!=null){
            if(user.getIsDelete()==0){
                if (user.getUserStatus()==1){
                    is=true;
                }
            }
        }
        if (is){
            return user;
        }else{
            return null;
        }
    }

    @Override
    public boolean checkPhone(String phone) {
        return userDao.selectByPhone(phone)>0;
    }
    //登录
    @Override
    public User login(String username, String password) {
        User user =userDao.selectByUsername(username);
        boolean is=false;
        if (user!=null){
            if(user.getIsDelete()==0){
                if (user.getUserStatus()==1){
                    boolean a=user.getPassword().equals(password);
                    if (a){
                        is=true;
                    }
                }
            }
        }
        if (is){
            return user;
        }else{
            return null;
        }
    }

    @Override
    public void register(User user) {
        userDao.insertUser(user);
    }
    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Override
    public void updateUserByUserId(User user) {
        userDao.updateUserByUserId(user);
    }
    /**
     * 修改用户密码
     * @param user
     * @return
     */
    @Override
    public void updatePasswordByUserId(User user) {
        userDao.updatePasswordByUserId(user);
    }
    /**
     * 修改用户头像
     * @param user
     * @return
     */
    @Override
    public void updateIconByUserId(User user) {
        userDao.updateIconByUserId(user);
    }
    /**
     * 插入用户全部信息
     * @param user
     * @return
     */
    @Override
    public void insertUserAll(User user) {
        if (user.getIcon()==null || user.getIcon()==""){
            userDao.insertUserAllNoIcon(user);
        }else{
            userDao.insertUserAll(user);
        }

    }

    /**
     * 修改用户全部信息
     * @param user
     * @return
     */
    @Override
    public void updateUserAllByUserId(User user) {
        userDao.updateUserAllByUserId(user);
    }
    /**
     * 修改用户账号状态
     * @param id
     * @return
     */
    @Override
    public void updUserStatusById(Integer userStatus,Integer id) {
        userDao.updUserStatusById(userStatus,id);
    }
    /**
     * 删除用户
     * @param id
     * @return
     */
    @Override
    public void delUserById(Integer id) {
        userDao.delUserById(id);
    }
}
