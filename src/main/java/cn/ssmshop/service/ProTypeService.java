package cn.ssmshop.service;

import cn.ssmshop.po.ProType;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午12:42
 */
public interface ProTypeService {
    /**
     * 查询所有的分类
     *
     * @return
     */
    List<ProType> findAll();

    /**
     * 获取有效的分类
     *
     * @return
     */
    List<ProType> findByStatus();

    /**
     * 添加一个分类，并且主键已经添加了
     *
     * @param protype
     */
    void addType(ProType protype);

    /**
     * 根据id查找分类
     *
     * @param protype
     * @return
     */
    ProType findPtById(ProType protype);

    /**
     * 更新这个po除了id以外的所有属性
     *
     * @param protype
     */
    void update(ProType protype);

    /**
     * 根据ID删除
     *
     * @param proType
     */
    void deleteById(ProType proType);


}
