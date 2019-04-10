package cn.ssmshop.controller;

import cn.ssmshop.po.Cart;
import cn.ssmshop.po.CartItem;
import cn.ssmshop.po.Product;
import cn.ssmshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author:黄广
 * @Description:购物车的控制层
 * @Date: Created in 19-2-15 下午5:45
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    ProductService productService;

    /**
     * 跳转到购物车页面
     *
     * @return
     */
    @RequestMapping("/cartUI")
    public String cartUI() {
        return "jsp/cart";
    }


    /**
     * 添加商品到购物车
     *
     * @param request
     * @param response
     * @param pid
     * @param count
     * @return
     */
    @RequestMapping("/addToCart")
    public void addToCart(HttpServletRequest request, HttpServletResponse response,
                          String pid, String count) {
        try {
            //获取商品
            Product product = new Product();
            product.setPid(pid);
            Product truePro = productService.findProById(product);

            //创建购物项
            CartItem cartItem = new CartItem(truePro, Integer.parseInt(count));

            //将购物项加入到购物车
            //获取购物车
            Cart cart = getCart(request);
            cart.addTocart(cartItem);

            /* 不能跳转 否则地址栏是.../cart/addToCart  每次一刷新 都会重复添加到购物车
            //跳转到购物车页面
            return "jsp/cart";
            */

            //出现了上面的问题，应该用重定向
            response.sendRedirect(request.getContextPath() + "/cart" +
                    "/cartUI");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/remove/{pid}")
    public void remove(@PathVariable("pid") String pid,
                       HttpServletRequest request, HttpServletResponse response) {
        try {
            // 获取购物车 执行移除
            getCart(request).removeFromCart(pid);

            //重定向
            response.sendRedirect(request.getContextPath() + "/cart" +
                    "/cartUI");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/clear")
    public void clear(HttpServletRequest request, HttpServletResponse response) {
        try {
            //获取购物车 执行清空操作
            getCart(request).clearCart();

            //重定向
            response.sendRedirect(request.getContextPath() + "/cart" +
                    "/cartUI");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取购物车
     *
     * @param req
     * @return
     */
    private Cart getCart(HttpServletRequest req) {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();

            //将cart放入当前的session中
            req.getSession().setAttribute("cart", cart);
        }
        return cart;
    }
}
