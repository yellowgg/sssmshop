package cn.ssmshop.controller;

import cn.ssmshop.po.*;
import cn.ssmshop.service.OrderService;
import cn.ssmshop.service.ProductService;
import cn.ssmshop.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author:黄广
 * @Description:订单模块
 * @Date: Created in 19-2-15 下午9:43
 */
@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    ProductService productService;


    /**
     * 按照用户分页查找订单
     *
     * @param pageNum
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping("/findPage/{pageNum}&{uid}")
    public String findPage(@PathVariable("pageNum") Integer pageNum,
                           @PathVariable("uid") String uid,
                           Model model) {
        //设置每页的对象数量
        int pageSize = 12;

        //开始根据页数和对象数和用户id分页查询
        PageBean<Orders> bean = orderService.findPage(pageNum, pageSize, uid);

        //如果该用户没有订单
        if (bean.getData().size() == 0) {
            model.addAttribute("msg", "您还没有订单哟(๑•̀ㅂ•́)و✧");
            return "jsp/msg";
        }

        //订单有了，但是订单项和其商品还没有，这就是没有弄pojo类的坏处 可恶，
        // 不然order包含orderItem的list  然后orderItem又包含product 直接传order就能得到一切了


        //获取订单项，因为获取出来的订单里面的orderItem<List>是没有东西的，
        //直接获取所有的订单项就行了，不用分别按订单号去获取，因为两者最终都是获取完所有的订单项
        //到时在前端判断订单项的订单号与相应的订单编号对应即可
        // List<OrderItem> oiList = orderService.findOrderItemsAll();


        //上面的写法的目的是为了获取所有的订单，也没错，只不过还需要再次访问数据库，
        //而下面是因为使用resultMap之后，Order类的List<OrderItem>已经有东西了，以前没有
        //所以直接从List那里再拿过这里就可以了  不用去访问数据库了
        List<OrderItem> oiList = new ArrayList<>();
        // 遍历每个订单
        for (Orders orders : bean.getData()) {
            //将每个订单的List<OrderItem>放到我们需要的oiList
            oiList.addAll(orders.getItems());
        }

        //订单项对应的商品
        List<Product> list = getProFromOi(oiList);


        //这样传过去的订单项和商品是混乱的，需要在前端判断
        //否则会出现每个订单都输出所有的订单项

        //把数据返回jsp
        model.addAttribute("od", bean);
        model.addAttribute("uid", uid);
        model.addAttribute("pro", list);
        model.addAttribute("oi", oiList);


        return "jsp/order_list";
    }

    /**
     * 提交订单，只提交 状态未知
     */
    @RequestMapping("/save")
    public String save(HttpServletRequest request, HttpServletResponse response,
                       Model model) {
        try {
            //从session中获取user
            User user = (User) request.getSession().getAttribute("loginUser");
            //应该判断user是否登录，但其实不用了，能提交订单已经是进入购物车，进入购物车已经是登录了

            //获取购物车
            Cart cart = (Cart) request.getSession().getAttribute("cart");

            //1.封装订单对象
            //1.1创建对象
            Orders order = new Orders();

            //1.2设置oid
            order.setOid(UUIDUtils.getId());

            //1.3设置ordertime
            order.setOtime(new Date());

            //1.4设置total 购物车中
            order.setOtotal(BigDecimal.valueOf(cart.getTotal()));

            //1.5设置state 0表示未付款 这里暂时就不弄常量类了 具体可参考jsp/order_list.jsp里面
            order.setOstatus("0");

            //1.6设置user
            order.setUid(user.getUid());

            //1.7设置items（订单项列表）遍历购物项列表 其实一整个购物车就是一个订单
            for (CartItem ci : cart.getCartItems()) {
                //1.7.1封装成orderitem
                //a.创建orderitem
                OrderItem oi = new OrderItem();

                //b.设置itemid uuid
                oi.setItemid(UUIDUtils.getId());

                //c.设置count 从ci中获取
                oi.setCount(ci.getCount());

                //d.设置subtotal 从ci中获取
                oi.setTotal(ci.getSubtotal());

                //e.设置product 从ci中获取
                oi.setPid(ci.getProduct().getPid());

                //f.设置order
                oi.setOid(order.getOid());

                //1.7.2 将orderitem加入order 的items中
                order.getItems().add(oi);
            }

            orderService.save(order);

            //清空购物车
            cart.clearCart();

            //在进入订单详情页之前，先把订单相关数据传回jsp
            //订单传回
            model.addAttribute("od", order);

            //订单项的信息传回，比如这种商品买了多少，总金额多少
            List<OrderItem> list1 = getOiFromOd(order);

            //每一种商品的信息传回
            List<Product> list = getProFromOi(list1);

            model.addAttribute("oi", list1);
            model.addAttribute("pro", list);
            //进到订单详情页
            return "jsp/order_info";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/toPay/{oid}")
    public String toPay(@PathVariable("oid") String oid, Model model) {
        //将选中的订单放到订单详情页,此页需要的数据是od oi pro
        Orders trueOrder = orderService.findOrderByOid(oid);

        //获取订单项
        List<OrderItem> oi = orderService.findOrderItemsByOid(trueOrder);

        //获取商品
        List<Product> pro = getProFromOi(oi);

        model.addAttribute("od", trueOrder);
        model.addAttribute("oi", oi);
        model.addAttribute("pro", pro);

        return "jsp/order_info";
    }

    @RequestMapping("/pay")
    public void pay(Orders order, HttpServletRequest request,
                    HttpServletResponse response) {
        try {
            //修改收货信息
            order.setOstatus("1");

            //更新
            orderService.update(order);

            //获取用户id
            User user = (User) request.getSession().getAttribute("loginUser");

            //重定向回订单列表
            response.sendRedirect(request.getContextPath() + "/orders" +
                    "/findPage/1&" + user.getUid());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/confirm/{oid}")
    public void confirm(@PathVariable("oid") String oid,
                        HttpServletRequest request, HttpServletResponse response) {
        try {
            //把这个订单的状态改成已收货
            Orders od = orderService.findOrderByOid(oid);
            od.setOstatus("3");

            //更新
            orderService.update(od);

            //获取用户id
            User user = (User) request.getSession().getAttribute("loginUser");

            //重定向回订单列表
            response.sendRedirect(request.getContextPath() + "/orders" +
                    "/findPage/1&" + user.getUid());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 从订单项列表中获取对应的商品
     *
     * @param oi
     * @return 包含了商品的list
     */
    private List<Product> getProFromOi(List<OrderItem> oi) {
        List<Product> list = new ArrayList<>();
        for (OrderItem o : oi) {
            Product product = new Product();
            product.setPid(o.getPid());
            Product proById = productService.findProById(product);
            list.add(proById);
        }
        return list;
    }

    /**
     * 从订单类的list<>
     *
     * @param orders
     * @return
     */
    private List<OrderItem> getOiFromOd(Orders orders) {
        List<OrderItem> list = new ArrayList<>();
        list.addAll(orders.getItems());
        return list;
    }
}
