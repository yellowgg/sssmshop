package cn.ssmshop.service;

import cn.ssmshop.po.PageBean;
import cn.ssmshop.po.Product;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午9:39
 */
public interface ProductService {

    /**
     * 添加商品
     *
     * @param product
     */
    void addProduct(Product product);

    /**
     * 查找所有商品
     *
     * @return
     */
    List<Product> findAll();

    /**
     * 根据ID删除
     *
     * @param product
     */
    void deleteById(Product product);

    /**
     * 根据id查找
     *
     * @param product
     * @return
     */
    Product findProById(Product product);

    /**
     * 更新信息
     *
     * @param product
     */
    void update(Product product);

    /**
     * 查找最新商品放到主页 数量固定为9个
     *
     * @return
     */
    List<Product> findNew();

    /**
     * 查找热门商品放到主页 数量固定为9个
     *
     * @return
     */
    List<Product> findHot();

    /**
     * 根据类型分页查询
     *
     * @param pageNum  活动页数
     * @param pageSize 每页的商品数量
     * @param ptid     商品类型
     * @return
     */
    PageBean<Product> findPage(Integer pageNum, Integer pageSize, String ptid);
}
