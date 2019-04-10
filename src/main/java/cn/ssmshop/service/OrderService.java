package cn.ssmshop.service;

import cn.ssmshop.po.OrderItem;
import cn.ssmshop.po.Orders;
import cn.ssmshop.po.PageBean;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-2-15 下午9:44
 */
public interface OrderService {

    /**
     * 根据用户分页查找
     *
     * @param pageNum
     * @param pageSize
     * @param uid
     * @return
     */
    PageBean<Orders> findPage(Integer pageNum, int pageSize, String uid);

    /**
     * 保存订单
     *
     * @param order
     */
    void save(Orders order);

    /**
     * 根据oid查找对应的订单项
     *
     * @param order
     * @return
     */
    List<OrderItem> findOrderItemsByOid(Orders order);

    /**
     * 获取所有的订单项
     *
     * @return
     */
    List<OrderItem> findOrderItemsAll();

    /**
     * 根据订单编号获取订单
     *
     * @param oid
     * @return
     */
    Orders findOrderByOid(String oid);

    /**
     * 获取所有的订单
     *
     * @return
     */
    List<Orders> findOrderAll();

    /**
     * 根据订单状态获取所有订单
     *
     * @param status
     * @return
     */
    List<Orders> findOdByStatus(String status);

    /**
     * 根据oid更新所有不为null的字段
     *
     * @param od
     */
    void update(Orders od);
}
