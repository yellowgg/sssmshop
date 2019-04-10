package cn.ssmshop.mapper;

import cn.ssmshop.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午9:00
 */
public interface UserMapper {
    List<User> findAll();

    void addUser(User user);

    User findByCode(@Param("code") String code);

    void update(User user);

    User findUser(@Param("user") User user);
}
