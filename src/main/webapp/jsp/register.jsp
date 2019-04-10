<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
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

        .container .row div {
            /* position:relative;
            float:left; */
        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
    </style>
</head>
<body>

<%--静态包含--%>
<%@include file="/jsp/head.jsp" %>


<div class="container"
     style="width:100%;background:url('${pageContext.request.contextPath}/images/regist_bg.jpg');">
    <div class="row">

        <div class="col-md-3"></div>

        <div class="col-md-6"
             style="background:#fff;padding:40px 80px;margin:30px;border:7px solid #ccc;">
            <span style="font-size: 24px">会员注册</span> USER REGISTER
            <form class="form-horizontal" style="margin-top:5px;" method="post"
                  action="${pageContext.request.contextPath }/user/register"
                  onsubmit="return validate()" name="form1">
                <div class="form-group">
                    <label for="username"
                           class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="username"
                               placeholder="请输入用户名" name="username">
                    </div>
                    <span style="color: red;font-size: large">*</span>
                </div>
                <div class="form-group">
                    <label for="password"
                           class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control"
                               id="password" placeholder="请输入密码"
                               name="password">
                    </div>
                    <span style="color: red;font-size: large">*</span>
                </div>
                <div class="form-group">
                    <label for="confirmpwd"
                           class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control"
                               name="confirmpwd"
                               onchange="return checkpwd()"
                               id="confirmpwd" placeholder="请输入确认密码">
                        <div id="tishi" style="color:red;"></div>
                    </div>
                    <span style="color: red;font-size: large">*</span>
                </div>
                <div class="form-group">
                    <label for="email"
                           class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control"
                               id="email" placeholder="请输入Email"
                               name="email">
                    </div>
                    <span style="color: red">*邮箱用于激活，请确保邮箱可用</span>
                </div>
                <div class="form-group">
                    <label for="name"
                           class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="name"
                               placeholder="请输入姓名" name="name">
                    </div>
                    <span style="color: red;font-size: large">*</span>
                </div>
                <div class="form-group">
                    <label for="tel"
                           class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="tel"
                               placeholder="请输入电话" name="tel">
                    </div>
                </div>
                <div class="form-group opt">
                    <label for="inlineRadio1"
                           class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="inlineRadio1"
                                   checked value="1"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="inlineRadio2"
                                   value="0"> 女
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthday"
                           class="col-sm-2 control-label">出生日期</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control"
                               name="birthday" id="birthday">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" width="100" value="注册"
                               name="submit" border="0"
                               style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                                       height:35px;width:100px;color:white;">
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-3"></div>

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
        } else if (document.getElementById("name").value == "") {
            alert("姓名不能为空");
            document.getElementById("name").focus();
            return false;
        } else if (document.getElementById("email").value == "") {
            alert("邮箱不能为空");
            document.getElementById("email").focus();
            return false;
        } else if (document.getElementById("password").value !=
            document.getElementById("confirmpwd").value) {
            alert("两次输入密码不一致，请重新输入");
            document.getElementById("confirmpwd").focus();
            return false;
        }
        return true;
    }

    // 确认密码
    function checkpwd() {
        var p1 = document.form1.password.value;//获取密码框的值
        var p2 = document.form1.confirmpwd.value;//获取重新输入的密码值
        if (p1 != p2) {//判断两次输入的值是否一致，不一致则显示错误信息
            document.getElementById("tishi").innerHTML = "两次输入密码不一致，请重新输入";//在div显示错误信息
            return false;
        } else {
            document.getElementById("tishi").innerHTML = "";
            return true;
        }
    }
</script>
</body>
</html>




