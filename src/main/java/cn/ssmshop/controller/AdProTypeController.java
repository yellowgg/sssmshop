package cn.ssmshop.controller;

import cn.ssmshop.po.ProType;
import cn.ssmshop.service.ProTypeService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author:黄广
 * @Description:后台管理商品类型
 * @Date: Created in 19-1-31 下午12:31
 */
@Controller
@RequestMapping("/adprotype")
public class AdProTypeController {

    @Autowired
    ProTypeService protypeService;

    /**
     * 查找所有的分类
     *
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model) {
        //调用业务层查询所有的分类
        List<ProType> list = protypeService.findAll();
        model.addAttribute("protypes", list);
        return "admin/protype/list";
    }

    /**
     * 根据ajax的请求，返回一个po的json字符串回去
     *
     * @param json
     * @return 返回源信息给页面加载便于修改
     */
    @RequestMapping("/findPtById")
    public @ResponseBody
    ProType findPtById(@RequestBody String json) {
        //获取ptid
        String ptid = JSONObject.parseObject(json).getString("ptid");


        ProType protype = new ProType();
        protype.setPtid(ptid);

        // 调用service 获取分类信息
        ProType result = protypeService.findPtById(protype);

        //3.获取之后转成json写回浏览器
        if (result != null) {
            return result;
        }
        return null;
    }


    /**
     * 点击添加分类，就直接在mainframe中显示添加分类的页面
     *
     * @return
     */
    @RequestMapping("/addView")
    public String addView() {
        return "admin/protype/add";
    }

    /**
     * 添加分类，完了之后返回分类列表
     *
     * @param protype
     * @param response
     * @param request
     */
    @RequestMapping("/addType")
    public String addType(ProType protype, HttpServletResponse response,
                          HttpServletRequest request) {
        try {
            protypeService.addType(protype);
            //添加完之后跳转回列表
            response.sendRedirect(request.getContextPath() + "/adprotype/findAll");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 更新信息
     *
     * @param protype
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/edit")
    public void edit(ProType protype, HttpServletResponse response,
                     HttpServletRequest request) {
        try {
            protypeService.update(protype);
            //修改完之后跳转回列表
            response.sendRedirect(request.getContextPath() + "/adprotype/findAll");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 使用RESTful风格
     *
     * @param id
     * @param response
     * @param request
     */
    @RequestMapping("/delete/{ptid}")
    public void deleteById(@PathVariable("ptid") String id,
                           HttpServletResponse response,
                           HttpServletRequest request) {
        try {
            ProType proType = new ProType();
            proType.setPtid(id);
            protypeService.deleteById(proType);
            //删除完之后跳转回列表
            response.sendRedirect(request.getContextPath() + "/adprotype/findAll");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
