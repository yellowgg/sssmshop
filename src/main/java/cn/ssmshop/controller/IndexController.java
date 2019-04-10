package cn.ssmshop.controller;

import cn.ssmshop.po.Product;
import cn.ssmshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author:黄广
 * @Description:前台主页模块
 * @Date: Created in 19-2-2 下午2:20
 */
@Controller
public class IndexController {

    @Autowired
    ProductService productService;

    @RequestMapping("/index")
    public String index(Model model) {
        //获取最新商品和热门商品放到主页
        List<Product> news = productService.findNew();
        List<Product> hots = productService.findHot();

        //放到页面
        model.addAttribute("news", news);
        model.addAttribute("hots", hots);

        return "jsp/index";
    }


}
