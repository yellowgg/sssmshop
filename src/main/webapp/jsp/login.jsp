<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
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

        font {
            color: #666;
            font-size: 22px;
            font-weight: normal;
            padding-right: 17px;
        }
    </style>
</head>
<body>

<%--静态包含--%>
<%@include file="/jsp/head.jsp" %>

<div class="container"
     style="width:100%;height:460px;background:#FF2C4C
             url('${pageContext.request.contextPath}/images/login_bg.jpg') no-repeat;">
    <div class="row">
        <div class="col-md-7"></div>
        <div class="col-md-5">
            <div style="width:440px;border:1px solid #E7E7E7;
            padding:20px 0px 2px 30px;border-radius:5px;margin-top:60px;background:#fff;">
                <span style="font-size: 24px">会员登录</span> USER LOGIN
                <div>&nbsp;</div>
                <form class="form-horizontal"
                      action="${pageContext.request.contextPath }/user/login"
                      method="post" onsubmit="return validate()">
                    <div class="form-group">
                        <label for="username"
                               class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"
                                   id="username" placeholder="请输入用户名"
                                   name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password"
                               class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control"
                                   id="password" placeholder="请输入密码"
                                   name="password">
                        </div>
                    </div>
                    <div>
                        <c:if test="${errorMsg!=null}">
                            <div align="center"
                                 style="color: red">${errorMsg}</div>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" width="100" value="登录"
                                   name="submit" border="0"
                                   style="background: url('${pageContext.request.contextPath}/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                                           height:35px;width:100px;color:white;">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--静态包含--%>
<%@include file="/jsp/foot.jsp" %>

<script type="text/javascript">
    // 禁止为空
    function validate() {
        if (document.getElementById("username").value == "") {
            alert("用户名不能为空");
            document.getElementById("username").focus();
            return false;
        } else if (document.getElementById("password").value == "") {
            alert("密码不能为空");
            document.getElementById("password").focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>