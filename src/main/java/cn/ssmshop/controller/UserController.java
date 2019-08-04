package cn.ssmshop.controller;

import cn.ssmshop.po.User;
import cn.ssmshop.service.UserService;
import cn.ssmshop.utils.CodeUtils;
import cn.ssmshop.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * @Author:黄广
 * @Description:前台用户模块
 * @Date: Created in 19-2-2 下午6:09
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/loginUI")
    public String loginUI() {
        return "jsp/login";
    }

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "jsp/login";
    }

    @RequestMapping("/registerUI")
    public String registerUI() {
        return "jsp/register";
    }

    @RequestMapping("/register")
    public String register(User user, Model model) {
        try {
            //手动封装id
            user.setUid(UUIDUtils.getId());

            //手动封装激活码
            user.setCode(UUIDUtils.getCode());

            //手动封装用户状态，这里直接设置，一般是弄一个常量类，以后再弄
            user.setState(0);

            //调用service
            userService.addUser(user);

            //提示
            model.addAttribute("msg", "恭喜你，注册成功，请尽快登录邮箱完成激活 o‿≖✧");

            return "jsp/msg";
        } catch (Exception e) {
            //错误提示
            model.addAttribute("msg", "出现未知错误，请联系管理员o‿≖✧\r\n" + e);
            return "jsp/msg";
        }
    }

    @RequestMapping("/active/{code}")
    public String active(@PathVariable("code") String code, Model model) {
        User user = userService.active(code);

        if (user == null) {
            model.addAttribute("msg", "没有找到这个用户！,请重新激活或重新注册！");
            return "jsp/msg";
        }

        //激活成功
        model.addAttribute("msg", "恭喜你激活成功！可以登录了");
        return "jsp/msg";
    }

    @RequestMapping("/login")
    public String login(HttpServletResponse response, String verifyCode,
                        HttpServletRequest request, User user, Model model) {
        try {
            //优先判断验证码
            String code = (String) request.getSession().getAttribute(
                    "verifyCodeValue");
            if (!code.equalsIgnoreCase(verifyCode)) {
                model.addAttribute("errorMsg", "验证码错误，请重新输入");
                return "jsp/login";
            }

            //调用service层寻找用户是否存在
            User trueUser = userService.findUser(user);

            //能查找出来，表示用户密码正确，否则提示密码错误
            if (trueUser == null) {
                //提示
                model.addAttribute("errorMsg", "密码错误，请重试");
                return "jsp/login";
            }

            //如果查找出来的用户状态未激活，提示激活
            if (trueUser.getState() == 0) {
                //提示
                model.addAttribute("msg", "该用户未激活，请尽快前往邮箱激活哟 o‿≖✧");
                return "jsp/msg";
            }


            //如果能走到这里，代表用户输入正确且已被激活，注入session,返回主界面
            request.getSession().setAttribute("loginUser", trueUser);
            response.sendRedirect(request.getContextPath() + "/index");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/loginOut")
    public void loginOut(HttpServletResponse response,
                         HttpServletRequest request) {
        try {
            // 清空有关session信息即可
            request.getSession().invalidate();
            //返回首页
            response.sendRedirect(request.getContextPath() + "/index");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取验证码
     * <p>
     * jsp中请求此方法获取字节流生成图片
     */
    @RequestMapping("/getVerifyCode")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = CodeUtils.drawing(output);
        System.out.println(verifyCodeValue);
        // session来一份
        session.setAttribute("verifyCodeValue", verifyCodeValue);
        try {
            // 页面来一份
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
