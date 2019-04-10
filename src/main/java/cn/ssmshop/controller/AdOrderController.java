package cn.ssmshop.controller;

import cn.ssmshop.po.OrderItem;
import cn.ssmshop.po.Orders;
import cn.ssmshop.po.Product;
import cn.ssmshop.service.OrderService;
import cn.ssmshop.service.ProductService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author:黄广
 * @Description:后台订单管理控制层
 * @Date: Created in 19-2-16 下午2:39
 */
@Controller
@RequestMapping("/adorders")
public class AdOrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    ProductService productService;

    @RequestMapping("/findAll")
    public String findAll(Model model) {
        //调用业务层查询所有的订单
        List<Orders> list = orderService.findOrderAll();
        model.addAttribute("orders", list);
        return "admin/order/list";
    }

    @RequestMapping("/findOdByStatus/{status}")
    public String findOdByStatus(@PathVariable("status") String status, Model model) {
        List<Orders> list = orderService.findOdByStatus(status);
        model.addAttribute("orders", list);
        return "admin/order/list";
    }

    @RequestMapping("/showDetail")
    public @ResponseBody
    List<Product> showDetail(@RequestBody String json) {
        //1.获取该订单下的商品转成json返回去
        //1.1获取oid
        String oid = JSONObject.parseObject(json).getString("oid");
        //1.2根据oid获取订单
        Orders orders = orderService.findOrderByOid(oid);
        //1.3拿到订单项
        List<OrderItem> oiList = orderService.findOrderItemsByOid(orders);
        //1.4拿到对应的商品
        List<Product> proList = getProFromOi(oiList);

        //2.返回json
        if (proList != null) {
            return proList;
        }
        return null;
    }

    /**
     * 从订单项列表中获取对应的商品
     *
     * @param oi
     * @return 包含了商品的list
     */
    private List<Product> getProFromOi(List<OrderItem> oi) {
        List<Product> list = new ArrayList<>();
        Product p;
        for (OrderItem o : oi) {
            p = new Product();
            p.setPid(o.getPid());
            Product proById = productService.findProById(p);
            list.add(proById);
        }
        return list;
    }

    @RequestMapping("/send/{oid}")
    public void send(@PathVariable("oid") String oid,
                     HttpServletRequest request, HttpServletResponse response) {
        try {
            //修改这个订单的状态为已发货 即2
            Orders od = orderService.findOrderByOid(oid);
            od.setOstatus("2");

            orderService.update(od);

            //重定向
            response.sendRedirect(request.getContextPath() + "/adorders" +
                    "/findOdByStatus/1");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
