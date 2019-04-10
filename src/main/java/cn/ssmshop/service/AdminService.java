package cn.ssmshop.service;

import cn.ssmshop.po.Admin;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-30 下午4:48
 */
public interface AdminService {

    /**
     * 根据传进去的admin查找所有匹配属性不为空的对象
     *
     * @param admin
     * @return a list<Admin>
     */
    List<Admin> findAdmin(Admin admin);
}
