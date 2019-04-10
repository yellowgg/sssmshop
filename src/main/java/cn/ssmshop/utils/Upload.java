package cn.ssmshop.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * @Author:黄广
 * @Description:用于文件上传
 * @Date: Created in 19-2-1 下午2:20
 */
public class Upload {

    /**
     * 主要作用是用于保存物理图片并返回一个相对路径名存储于数据库
     *
     * @param file        上传的文件
     * @param uuid        给文件命名的UUID，同时也可用于商品的UUID
     * @param realPath    存储图片的真实路径
     * @param virtualPath 存储图片的虚拟路径
     * @return 如果为null则是不成功
     */
    public static String upImage(MultipartFile file, String uuid,
                                 String realPath, String virtualPath) {
        try {

            //定义文件名
            String filename = null;

            //获取文件类型（后缀）
            String contentType = file.getContentType();
            //因为获取的后缀是XXXX/xxx形式 比如image/jpeg
            contentType = contentType.substring(contentType.indexOf("/") + 1);

            filename = uuid + "." + contentType;

            //将图片保存于物理磁盘
            file.transferTo(new File(realPath + "/" + filename));

            //返回一个虚拟路径存于数据库
            return virtualPath + "/" + filename;
        } catch (Exception e) {
            return null;
        }
    }
}
