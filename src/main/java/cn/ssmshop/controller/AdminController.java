package cn.ssmshop.controller;

import cn.ssmshop.po.Admin;
import cn.ssmshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author:黄广
 * @Description:后台管理登录
 * @Date: Created in 19-1-30 下午4:47
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    /**
     * 登录
     * 关于直接访问login能进后台的原因，因为即使不输入用户名密码，也会把admin传参查询，所以会进后台
     * <p>
     * 直接判断admin是否有值，没有就不给传，就解决了
     *
     * @param request
     * @param admin
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String findAdmin(HttpServletRequest request, Admin admin, Model model) {
        List<Admin> adminList;
        //再加个判断，因为进主页只有走这个login 登录了再<-回去的话。再访问会说没登录，所以加个session判断
        if (request.getSession().getAttribute("admin") != null) {
            return "admin/home";
        }
        if (admin.getName() == null && admin.getPassword() == null) {
            model.addAttribute("errorMsg", "检测到未登录，请登录！");
            return "admin/index";
        } else {
            adminList = adminService.findAdmin(admin);
        }
        if (adminList != null && adminList.size() > 0) {
            request.getSession().setAttribute("admin", adminList.get(0));
            return "admin/home";
        } else {
            model.addAttribute("errorMsg", "登录错误，请重试！");
            return "admin/index";
        }
    }

    /**
     * 跳转到登录页面,这个主要是给拦截器拦住之后跳转的
     *
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "admin/index";
    }

    /**
     * 退出
     *
     * @param request
     * @return
     */
    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request) {
        // 清空有关session信息即可
        request.getSession().invalidate();
        //返回登陆界面
        return "admin/index";
    }

    /**
     * 访问后台主页（默认是登录页）
     *
     * @return
     */
    @RequestMapping("/index")
    public String index() {
        return "admin/index";
    }

    /**
     * 访问后台登录后的管理页
     *
     * @return
     */
    @RequestMapping("/home")
    public String home() {
        return "admin/home";
    }
}
