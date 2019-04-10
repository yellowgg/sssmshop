package cn.ssmshop.mapper;

import cn.ssmshop.po.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {

    List<Admin> findAdmin(@Param("admin") Admin admin);
}