package cn.ssmshop.controller;

import cn.ssmshop.po.PageBean;
import cn.ssmshop.po.Product;
import cn.ssmshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author:黄广
 * @Description:前台商品模块
 * @Date: Created in 19-2-2 下午12:20
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService productService;

    /**
     * 按照类型分页查找商品
     *
     * @param pageNum
     * @param ptid
     * @param model
     * @return
     */
    @RequestMapping("/findPage/{pageNum}&{ptid}")
    public String findPage(@PathVariable("pageNum") Integer pageNum,
                           @PathVariable("ptid") String ptid,
                           Model model) {
        //设置每页的对象数量
        int pageSize = 12;

        //开始根据页数和对象数和类型分页查询
        PageBean<Product> bean = productService.findPage(pageNum, pageSize,
                ptid);

        //如果该类型没有商品，就跳转提示页面
        if (bean.getData().size() == 0) {
            model.addAttribute("msg", "该分类无商品(๑•̀ㅂ•́)و✧");
            return "jsp/msg";
        }

        //把数据返回jsp
        model.addAttribute("pb", bean);
        model.addAttribute("type", ptid);

        return "jsp/product_list";
    }

    /**
     * 根据id获取单个商品信息
     *
     * @param pid
     * @return
     */
    @RequestMapping("/findProduct/{pid}")
    public String findProduct(@PathVariable("pid") String pid, Model model) {
        //封装一个pojo对象用于查找
        Product product = new Product();
        product.setPid(pid);
        Product truePro = productService.findProById(product);

        model.addAttribute("pro", truePro);

        return "jsp/product_info";
    }

}
