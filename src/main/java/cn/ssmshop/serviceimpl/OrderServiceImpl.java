package cn.ssmshop.serviceimpl;

import cn.ssmshop.mapper.OrderItemMapper;
import cn.ssmshop.mapper.OrdersMapper;
import cn.ssmshop.po.OrderItem;
import cn.ssmshop.po.Orders;
import cn.ssmshop.po.PageBean;
import cn.ssmshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-2-15 下午9:49
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrdersMapper ordersMapper;
    @Autowired
    OrderItemMapper orderItemMapper;

    @Override
    public PageBean<Orders> findPage(Integer pageNum, int pageSize,
                                     String uid) {
        //1.创建pageBean
        PageBean<Orders> pb = new PageBean<>(pageNum, pageSize);

        //2.设置当前页数据
        List<Orders> data = ordersMapper.findPage(pb.getStartIndex(),
                pageSize, uid);
        pb.setData(data);

        //3.设置总记录数
        int totalRecord = ordersMapper.getTotalRecord(uid);
        pb.setTotalRecord(totalRecord);

        //返回包装好的订单分页
        return pb;
    }

    /**
     * 保存订单
     *
     * @param order
     */
    @Override
    public void save(Orders order) {
        if (order.getItems().size() > 0) {
            //保存订单
            ordersMapper.save(order);
            for (OrderItem oi : order.getItems()) {
                orderItemMapper.save(oi);
            }
        }
    }

    /**
     * 根据oid查找对应的订单项
     *
     * @param order
     * @return
     */
    @Override
    public List<OrderItem> findOrderItemsByOid(Orders order) {
        return orderItemMapper.findOrderItemsByOid(order.getOid());
    }

    /**
     * 获取所有的订单项
     *
     * @return
     */
    @Override
    public List<OrderItem> findOrderItemsAll() {
        return orderItemMapper.findOrderItemsAll();
    }

    /**
     * 根据订单编号获取订单
     *
     * @param oid
     * @return
     */
    @Override
    public Orders findOrderByOid(String oid) {
        return ordersMapper.findOrderByOid(oid);
    }

    /**
     * 获取所有的订单
     *
     * @return
     */
    @Override
    public List<Orders> findOrderAll() {
        return ordersMapper.findOrderAll();
    }

    /**
     * 根据订单状态获取所有订单
     *
     * @param status
     * @return
     */
    @Override
    public List<Orders> findOdByStatus(String status) {
        return ordersMapper.findOdByStatus(status);
    }

    /**
     * 根据oid更新所有不为null的字段
     *
     * @param od
     */
    @Override
    public void update(Orders od) {
        ordersMapper.update(od);
    }
}
