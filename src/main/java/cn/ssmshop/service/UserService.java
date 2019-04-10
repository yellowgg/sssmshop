package cn.ssmshop.service;

import cn.ssmshop.po.User;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午8:58
 */
public interface UserService {


    /**
     * 查询已激活用户
     *
     * @return
     */
    List<User> findAll();

    /**
     * 添加用户，即注册，不过是未激活状态的用户
     *
     * @param user
     * @throws Exception
     */
    void addUser(User user) throws Exception;

    /**
     * 激活用户
     *
     * @param code
     * @return 返回激活成功的用户，若为null则表示没有此用户
     */
    User active(String code);

    /**
     * 查找登录用户
     *
     * @param user
     * @return
     */
    User findUser(User user);
}
