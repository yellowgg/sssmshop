package cn.ssmshop.serviceimpl;

import cn.ssmshop.mapper.UserMapper;
import cn.ssmshop.po.User;
import cn.ssmshop.service.UserService;
import cn.ssmshop.utils.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午8:59
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    /**
     * 查询已激活用户
     *
     * @return
     */
    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    /**
     * 添加用户，即注册，不过是未激活状态的用户
     *
     * @param user
     */
    @Override
    public void addUser(User user) throws Exception {
        userMapper.addUser(user);

        //发送邮件告知
        String emailMsg =
                "恭喜" + user.getName() +
                        ":成为我们商城的一员，<a href='http://localhost:8080" +
                        "/sssmshop/user" +
                        "/active/"
                        + user.getCode() +
                        "'>点此激活</a>";
        MailUtils.sendMail(user.getEmail(), emailMsg);
    }

    /**
     * 激活用户
     *
     * @param code
     * @return
     */
    @Override
    public User active(String code) {
        // 通过code获取用户
        User user = userMapper.findByCode(code);

        //如果通过激活码没有找到用户
        if (user == null) {
            return null;
        }

        //如果找到了用户
        user.setState(1);
        user.setCode(null);

        userMapper.update(user);
        return user;
    }

    /**
     * 查找登录用户
     *
     * @param user
     * @return
     */
    @Override
    public User findUser(User user) {
        User trueUser = userMapper.findUser(user);
        return trueUser;
    }
}
