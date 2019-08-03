<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/bootstrap.min.css"
          type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
            type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css"
          type="text/css"/>

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
    </style>
</head>

<body>

<%@include file="/jsp/head.jsp" %>


<div class="container">
    <div class="row">

        <div style="margin:0 auto;width:950px;">
            <div class="col-md-6">
                <img style="opacity: 1;width:400px;height:350px;" title=""
                     class="medium"
                     src="/${pro.pimg}">
            </div>
            <div class="col-md-6">
                <div><strong>${pro.pname }</strong></div>
                <div style="margin:10px 0 10px 0;">商城价: <strong
                        style="color:#ef0101;">￥${pro.pprice }元</strong>
                </div>
                <div style="margin:10px 0 10px 0;">剩余数量: <strong
                        style="color:#ef0101;">${pro.pcount }</strong>
                </div>

                <div style="padding:10px;border:1px solid #e7dbb1;width:330px;
                margin:15px 0 10px 0;;background-color: #fffee6;">
                    <form
                            action="${pageContext.request.contextPath }/cart/addToCart"
                            id="form" method="post">
                        <!-- 商品的pid -->
                        <input type="hidden" name="pid" value="${pro.pid }">

                        <div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">
                            购买数量:
                            <input id="quantity" name="count" value="1"
                                   maxlength="4" size="10" type="text"></div>
                        <div style="margin:20px 0 10px 0;;text-align: center;"/>
                    </form>
                    <a href="javascript:void(0)"
                       onclick="return subForm('${pro.pcount}')">
                        <input style="background: url('${pageContext.request.contextPath}/images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;"
                               value="加入购物车" type="button">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div style="width:950px;margin:0 auto;">
        <div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
            <strong>商品介绍</strong>
        </div>
        <strong>${pro.pdetailed }</strong>
    </div>
</div>

<%--静态包含--%>
<%@include file="/jsp/foot.jsp" %>


</body>
<script type="text/javascript">
    function subForm(pcount) {
        //先判断购买数量
        // 在js中 两个数字型字符串相比较会按一位一位的比较，所以解决方法是保证有一个是数字型
        var count = parseInt(document.getElementById("quantity").value);
        if (count <= 0 || count > pcount) {
            alert("您购买的数量不正确，请重新输入，啾咪")
            return false;
        }
        //让指定的表单提交
        document.getElementById("form").submit();
        return true;
    }
</script>
</html>