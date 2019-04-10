package cn.ssmshop.controller;

import cn.ssmshop.po.ProType;
import cn.ssmshop.service.ProTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author:黄广
 * @Description:前台分类模块
 * @Date: Created in 19-2-2 下午1:15
 */
@Controller
@RequestMapping("/protype")
public class ProTypeController {

    @Autowired
    ProTypeService proTypeService;

    /**
     * 查找有效分类
     *
     * @return 返回到jsp json
     */
    @RequestMapping("/findByStatus")
    public @ResponseBody
    List<ProType> findByStatus() {
        //调用业务层查询所有的分类
        List<ProType> list = proTypeService.findByStatus();
        if (list != null && list.size() > 0) {
            return list;
        }
        return null;
    }
}
