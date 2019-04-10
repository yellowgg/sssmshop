package cn.ssmshop.po;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @Author:黄广
 * @Description: 购物车里面显示的每一个商品项
 * @Date: Created in 19-2-15 下午6:08
 */
@Data //相当@Setter @Getter,@ToString,@EqualsAndHashCode
public class CartItem {
    private Product product;
    private Double subtotal;
    private Integer count;

    public CartItem() {
    }

    public CartItem(Product product, Integer count) {
        this.product = product;
        this.count = count;
    }

    /**
     * 获取该商品的小计
     *
     * @return
     */
    public Double getSubtotal() {
        BigDecimal counts = new BigDecimal(count.toString());
        BigDecimal multiply = product.getPprice().multiply(counts);
        return multiply.doubleValue();
    }

}
