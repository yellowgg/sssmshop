package cn.ssmshop.mapper;

import cn.ssmshop.po.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午9:41
 */
public interface ProductMapper {
    void addProduct(Product product);

    List<Product> findAll();

    void deleteById(Product product);

    Product findProById(Product product);

    void update(Product product);

    List<Product> findNew();

    List<Product> findHot();

    List<Product> findPage(@Param("startIndex") Integer startIndex,
                           @Param("pageSize") Integer pageSize,
                           @Param("ptid") String ptid);

    int getTotalRecord(@Param("ptid") String ptid);
}
