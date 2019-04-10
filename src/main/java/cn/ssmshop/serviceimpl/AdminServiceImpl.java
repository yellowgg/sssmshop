package cn.ssmshop.serviceimpl;

import cn.ssmshop.mapper.AdminMapper;
import cn.ssmshop.po.Admin;
import cn.ssmshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:黄广
 * @Description:
 * @Date: Created in 19-1-30 下午4:48
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    /**
     * 根据传进去的admin查找所有匹配属性不为空的对象
     *
     * @param admin
     * @return a list<Admin>
     */
    @Override
    public List<Admin> findAdmin(Admin admin) {
        admin.setStatus("1");
        List<Admin> adminList = adminMapper.findAdmin(admin);
        return adminList;
    }
}
