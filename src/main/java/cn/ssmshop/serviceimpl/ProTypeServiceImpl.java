package cn.ssmshop.serviceimpl;

import cn.ssmshop.mapper.ProTypeMapper;
import cn.ssmshop.po.ProType;
import cn.ssmshop.service.ProTypeService;
import cn.ssmshop.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午12:42
 */
@Service
public class ProTypeServiceImpl implements ProTypeService {

    @Autowired
    ProTypeMapper proTypeMapper;

    /**
     * 查询所有的分类
     *
     * @return
     */
    @Override
    public List<ProType> findAll() {
        return proTypeMapper.findAll();
    }

    /**
     * 获取有效的分类
     *
     * @return
     */
    @Override
    public List<ProType> findByStatus() {
        return proTypeMapper.findByStatus();
    }

    /**
     * 添加一个分类，并且主键已经添加了
     *
     * @param protype
     */
    @Override
    public void addType(ProType protype) {
        protype.setPtid(UUIDUtils.getId());
        protype.setPtstatus("1");
        proTypeMapper.addType(protype);
    }

    /**
     * 根据id查找分类
     *
     * @param protype
     * @return
     */
    @Override
    public ProType findPtById(ProType protype) {
        return proTypeMapper.findPtById(protype);
    }

    /**
     * 更新这个po除了id以外的所有属性
     *
     * @param protype
     */
    @Override
    public void update(ProType protype) {
        proTypeMapper.update(protype);
    }

    /**
     * 根据ID删除
     *
     * @param proType
     */
    @Override
    public void deleteById(ProType proType) {
        proTypeMapper.deleteById(proType);
    }


}
