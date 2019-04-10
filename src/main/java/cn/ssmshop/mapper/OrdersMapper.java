package cn.ssmshop.mapper;

import cn.ssmshop.po.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersMapper {


    List<Orders> findPage(@Param("startIndex") Integer startIndex,
                          @Param("pageSize") Integer pageSize,
                          @Param("uid") String uid);

    int getTotalRecord(@Param("uid") String uid);

    void save(Orders order);

    Orders findOrderByOid(@Param("oid") String oid);

    List<Orders> findOrderAll();

    List<Orders> findOdByStatus(@Param("status") String status);

    void update(Orders od);
}