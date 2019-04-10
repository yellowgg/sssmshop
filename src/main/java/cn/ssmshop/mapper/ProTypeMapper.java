package cn.ssmshop.mapper;

import cn.ssmshop.po.ProType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-31 下午12:48
 */
public interface ProTypeMapper {
    List<ProType> findAll();

    void addType(ProType protype);

    ProType findPtById(@Param("protype") ProType protype);

    void update(ProType protype);

    void deleteById(ProType proType);

    List<ProType> findByStatus();
}
