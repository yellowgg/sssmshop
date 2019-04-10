package cn.ssmshop.serviceimpl;

import cn.ssmshop.mapper.ProductMapper;
import cn.ssmshop.po.PageBean;
import cn.ssmshop.po.Product;
import cn.ssmshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午9:40
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductMapper productMapper;

    /**
     * 添加商品
     *
     * @param product
     */
    @Override
    public void addProduct(Product product) {
        productMapper.addProduct(product);
    }

    /**
     * 查找所有商品
     *
     * @return
     */
    @Override
    public List<Product> findAll() {
        return productMapper.findAll();
    }

    /**
     * 根据ID删除
     *
     * @param product
     */
    @Override
    public void deleteById(Product product) {
        //在这里把图片给删了
        product = findProById(product);
        File file = new File("/home/" + product.getPimg());
        file.delete();

        productMapper.deleteById(product);
    }

    /**
     * 根据id查找
     *
     * @param product
     * @return
     */
    @Override
    public Product findProById(Product product) {
        return productMapper.findProById(product);
    }

    /**
     * 更新信息
     *
     * @param product
     */
    @Override
    public void update(Product product) {
        productMapper.update(product);
    }

    /**
     * 查找最新商品放到主页 数量固定为9个
     *
     * @return
     */
    @Override
    public List<Product> findNew() {
        return productMapper.findNew();
    }

    /**
     * 查找热门商品放到主页 数量固定为9个
     *
     * @return
     */
    @Override
    public List<Product> findHot() {
        return productMapper.findHot();
    }

    /**
     * 根据类型分页查询
     *
     * @param pageNum  活动页数
     * @param pageSize 每页的商品数量
     * @param ptid     商品类型
     * @return
     */
    @Override
    public PageBean<Product> findPage(Integer pageNum, Integer pageSize,
                                      String ptid) {
        //1.创建pageBean
        PageBean<Product> pb = new PageBean<>(pageNum, pageSize);

        //2.设置当前页数据
        List<Product> data = productMapper.findPage(pb.getStartIndex(),
                pageSize, ptid);
        pb.setData(data);

        //3.设置总记录数
        int totalRecord = productMapper.getTotalRecord(ptid);
        pb.setTotalRecord(totalRecord);

        //返回包装好的商品分页
        return pb;
    }
}
