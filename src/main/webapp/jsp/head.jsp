<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="container-fluid">
    <div class="col-md-4">
        <img src="${pageContext.request.contextPath}/img/logo.jpg"/>
    </div>
    <div class="col-md-5">
        <img src="${pageContext.request.contextPath}/img/header.png"/>
    </div>
    <div class="col-md-3" style="padding-top:20px">
        <ul class="list-inline">
            <c:if test="${empty loginUser}">
                <li>
                    <a href="${pageContext.request.contextPath}/user/loginUI">登录
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/registerUI">注册
                    </a>
                </li>
            </c:if>
            <c:if test="${not empty loginUser}">
                ${loginUser.name}:雷猴啊！
                <li><a
                        href="${pageContext.request.contextPath}/orders/findPage/1&${loginUser.uid}">我的订单</a>
                </li>
                <li>
                    <a
                            href="${pageContext.request.contextPath}/user/loginOut">退出</a>
                </li>
            </c:if>

            <li>
                <a href="${pageContext.request.contextPath}/cart/cartUI">购物车</a>
            </li>
        </ul>
    </div>
</div>

<div class="container-fluid">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand"
                   href="${pageContext.request.contextPath}/index">首页</a>
            </div>

            <div class="collapse navbar-collapse"
                 id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="c_ul">

                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" id="sousuo"
                               placeholder="请输入。。。">
                    </div>
                    <button type="submit" class="btn btn-default"
                            onclick="return no()">搜索
                    </button>
                </form>

            </div>

        </div>

    </nav>
</div>

<script type="text/javascript">
    function no() {
        alert("暂未开发。。");
        $("#sousuo").val('');
        return false;
    }

    $(document).ready(function () {
        $(function () {
            //发送ajax 查询所有分类
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/protype/findByStatus',
                contentType: 'application/json;charset=utf-8',
                data: {"": ""},//数据格式是json串
                success: function (data) {
                    //遍历json列表，获取每一个分类，包装成li标签，插入到ul内部
                    for (var i = 0; i < data.length; i++) {
                        var ptname = data[i].ptname;
                        var ptid = data[i].ptid;
                        $("#c_ul").append("<li><a " +
                            "href='${pageContext.request.contextPath}/product/findPage/1&" + ptid
                            + "'>" + ptname +
                            "</a></li>")
                    }
                }
            })
        })
    })
</script>
