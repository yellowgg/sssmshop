package cn.ssmshop.po;

import lombok.Data;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author:黄广
 * @Description: 购物车类，无非有四个操作，清除购物车，获取购物车，添加一个商品，删除一个商品
 * @Date: Created in 19-2-15 下午6:08
 */
@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class Cart {
    private Map<String, CartItem> itemMap = new HashMap<String, CartItem>();
    private Double total = 0.0;

    /**
     * 获取所有的购物项
     *
     * @return
     */
    public Collection<CartItem> getCartItems() {
        return itemMap.values();
    }

    /**
     * 清空购物车
     */
    public void clearCart() {
        //1.清空map
        itemMap.clear();

        //2.修改总金额为0
        total = 0.0;
    }

    /**
     * 加入购物车
     *
     * @param cartItem
     */
    public void addTocart(CartItem cartItem) {
        //获取商品的id
        String pid = cartItem.getProduct().getPid();

        //1.判断购物车中是否有
        if (itemMap.containsKey(pid)) {
            //有   修改数量 = 原来数量 + 新加的数量
            //原来的
            CartItem oItem = itemMap.get(pid);

            oItem.setCount(oItem.getCount() + cartItem.getCount());

        } else {
            //无
            itemMap.put(pid, cartItem);
        }

        //2.修改总金额
        total += cartItem.getSubtotal();
    }

    /**
     * 从购物车移除一个购物项
     *
     * @param pid
     */
    public void removeFromCart(String pid) {
        //1.从购物车（map）中移除购物项
        CartItem item = itemMap.remove(pid);

        //2.修改总金额
        total -= item.getSubtotal();
    }
}
