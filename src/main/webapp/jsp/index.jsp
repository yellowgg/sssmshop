<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>守望商城</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/bootstrap.min.css"
          type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
            type="text/javascript"></script>
</head>

<body>
<%--静态包含--%>
<%@include file="/jsp/head.jsp" %>

<div class="container-fluid">
    <%--轮播图--%>
    <div class="container-fluid">
        <div id="carousel-example-generic" class="carousel slide"
             data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0"
                    class="active"></li>
                <li data-target="#carousel-example-generic"
                    data-slide-to="1"></li>
                <li data-target="#carousel-example-generic"
                    data-slide-to="2"></li>
            </ul>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/img/1.jpg">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/2.jpg">
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/3.jpg">
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>

            <a class="left carousel-control" href="#carousel-example-generic"
               role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"
                      aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic"
               role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"
                      aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <%--热门商品--%>
    <div class="container-fluid">
        <div class="col-md-12">
            <h2>热门商品&nbsp;&nbsp;<img
                    src="${pageContext.request.contextPath}/img/title2.jpg"/>
            </h2>
        </div>
        <div class="col-md-2"
             style="border:1px solid #E7E7E7;border-right:0;padding:0;">
            <%--固定竖图--%>
            <img src="${pageContext.request.contextPath}/pimg/hao/big01.jpg"
                 width="205" height="404"
                 style="display: inline-block;"/>
        </div>
        <div class="col-md-10">
            <div class="col-md-6"
                 style="text-align:center;height:200px;padding:0px;">
                <%--固定横图--%>
                <img src="${pageContext.request.contextPath}/pimg/hao/middle01.jpg"
                     width="516px" height="200px"
                     style="display: inline-block;">
            </div>
            <%--动态读取热门商品--%>
            <c:forEach items="${hots }" var="p">
                <div class="col-md-2"
                     style="text-align:center;height:200px;padding:10px 0px;">
                    <a href="${pageContext.request.contextPath}/product/findProduct/${p.pid}"
                       title="${p.pname}">
                        <img src="/${p.pimg}"
                             width="130" height="130"
                             style="display: inline-block;">
                    </a>
                    <p>
                        <a href="${pageContext.request.contextPath}/product/findProduct/${p.pid}"
                           style='color:#666'
                           title="${p.pname}">${fn:substring(p.pname,0,6)}.
                            .</a></p>
                    <p><font color="#E4393C"
                             style="font-size:16px">&yen;${p.pprice }</font>
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>

    <%--中间横图--%>
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/pimg/hao/ad.jpg"
             width="100%"/>
    </div>

    <%--最新商品--%>
    <div class="container-fluid">
        <div class="col-md-12">
            <h2>最新商品&nbsp;&nbsp;<img
                    src="${pageContext.request.contextPath}/img/title2.jpg"/>
            </h2>
        </div>
        <div class="col-md-2"
             style="border:1px solid #E7E7E7;border-right:0;padding:0;">
            <%--固定竖图--%>
            <img src="${pageContext.request.contextPath}/pimg/hao/big02.jpg"
                 width="205" height="404"
                 style="display: inline-block;"/>
        </div>
        <div class="col-md-10">
            <div class="col-md-6"
                 style="text-align:center;height:200px;padding:0px;">
                <%--固定横图--%>
                <img src="${pageContext.request.contextPath}/pimg/hao/middle02.jpg"
                     width="516px" height="200px"/>

            </div>
            <%--动态读取最新商品--%>
            <c:forEach items="${news }" var="p">
                <div class="col-md-2"
                     style="text-align:center;height:200px;padding:10px 0px;">
                        <%--点击图片也可跳转商品详情--%>
                    <a href="${pageContext.request.contextPath}/product/findProduct/${p.pid}"
                       title="${p.pname}">
                        <img src="/${p.pimg }"
                             width="130" height="130"
                             style="display: inline-block;">
                    </a>
                    <p><%--点击名字也可跳转商品详情--%>
                        <a href="${pageContext.request.contextPath}/product/findProduct/${p.pid}"
                           style='color:#666'
                           title="${p.pname}">${fn:substring(p.pname,0,6)}.
                            .</a></p>
                    <p><font color="#E4393C"
                             style="font-size:16px">&yen;${p.pprice }</font>
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<%--静态包含--%>
<%@include file="/jsp/foot.jsp" %>

</body>
</html>