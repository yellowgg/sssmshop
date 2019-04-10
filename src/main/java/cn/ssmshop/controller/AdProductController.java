package cn.ssmshop.controller;

import cn.ssmshop.po.ProType;
import cn.ssmshop.po.Product;
import cn.ssmshop.service.ProTypeService;
import cn.ssmshop.service.ProductService;
import cn.ssmshop.utils.UUIDUtils;
import cn.ssmshop.utils.Upload;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @Author:黄广
 * @Description:后台管理商品
 * @Date: Created in 19-1-31 下午9:14
 */
@Controller
@RequestMapping("/adproduct")
public class AdProductController {

    @Autowired
    ProductService productService;
    @Autowired
    ProTypeService proTypeService;

    /**
     * 点击添加商品，就直接在mainframe中显示添加商品的页面
     * <p>
     * 在那之前，先读取有效商品类型并放进去
     *
     * @return
     */
    @RequestMapping("/addView")
    public String addView(Model model) {
        List<ProType> list = proTypeService.findByStatus();
        model.addAttribute("protypes", list);
        return "admin/product/add";
    }

    /**
     * 添加商品，之后返回列表页
     *
     * @param product
     * @param response
     * @param request
     */
    @RequestMapping("/addProduct")
    public String addProduct(Product product, MultipartFile file,
                             Model model, HttpServletResponse response,
                             HttpServletRequest request) {
        try {
            /*
            从前端就已经保证必须上传图片
            大小不超过5M 更且格式必须是jpg jpeg png
            */

            // 获取UUID
            String uuid = UUIDUtils.getId();

            //调用工具保存图片
            String path = Upload.upImage(file, uuid, "/home/pimg",
                    "pimg");

            //包装product
            product.setPimg(path);
            product.setPid(uuid);
            product.setPdate(new Date());


            productService.addProduct(product);
            //添加完之后跳转回列表
            response.sendRedirect(request.getContextPath() + "/adproduct" +
                    "/findAll");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查找所有的商品
     *
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model) {
        //调用业务层查询所有的商品
        List<Product> list = productService.findAll();
        model.addAttribute("products", list);
        return "admin/product/list";
    }

    /**
     * 删除某个商品。使用RESTful风格
     *
     * @param id
     * @param response
     * @param request
     */
    @RequestMapping("/delete/{pid}")
    public void deleteById(@PathVariable("pid") String id,
                           HttpServletResponse response,
                           HttpServletRequest request) {
        try {
            Product product = new Product();
            product.setPid(id);
            productService.deleteById(product);
            //删除完之后跳转回列表
            response.sendRedirect(request.getContextPath() + "/adproduct" +
                    "/findAll");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据ajax的请求，返回一个po的json字符串回去
     *
     * @param json
     * @return
     */
    @RequestMapping("/findProById")
    public @ResponseBody
    Product findProById(@RequestBody String json) {
        //获取pid
        String pid = JSONObject.parseObject(json).getString("pid");

        Product product = new Product();
        product.setPid(pid);

        // 调用service 获取商品信息
        Product result = productService.findProById(product);

        //3.获取之后转成json写回浏览器
        if (result != null) {
            return result;
        }
        return null;
    }

    /**
     * 更新信息
     *
     * @param product
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/edit")
    public String edit(Product product, HttpServletResponse response,
                       HttpServletRequest request) {
        try {
            productService.update(product);
            //修改完之后跳转回列表
            response.sendRedirect(request.getContextPath() + "/adproduct" +
                    "/findAll");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
