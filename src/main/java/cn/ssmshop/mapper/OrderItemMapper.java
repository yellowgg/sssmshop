package cn.ssmshop.mapper;

import cn.ssmshop.po.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderItemMapper {

    void save(OrderItem oi);

    List<OrderItem> findOrderItemsByOid(@Param("oid") String oid);

    List<OrderItem> findOrderItemsAll();
}