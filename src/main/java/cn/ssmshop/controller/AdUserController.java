package cn.ssmshop.controller;

import cn.ssmshop.po.User;
import cn.ssmshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author:黄广
 * @Description:后台管理用户
 * @Date: Created in 19-1-31 下午8:54
 */
@Controller
@RequestMapping("/aduser")
public class AdUserController {

    @Autowired
    UserService userService;

    /**
     * 查找所有的激活用户
     *
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model) {
        //调用业务层查询所有的用户
        List<User> list = userService.findAll();
        model.addAttribute("users", list);
        return "admin/user/list";
    }
}
