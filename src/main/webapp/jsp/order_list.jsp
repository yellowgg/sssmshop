<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单列表</title>
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

        <div style="margin:0 auto; margin-top:10px;width:950px;">
            <strong>我的订单</strong>
            <table class="table table-bordered">
                <c:forEach items="${od.data}" var="o">
                    <tbody>
                    <tr class="warning">
                        <th colspan="2">订单编号:${o.oid } </th>
                        <th colspan="1">
                            <c:if test="${o.ostatus == 0 }"><a
                                    style="color:blue"
                                    href="${pageContext.request.contextPath}/orders/toPay/${o.oid}">
                                去付款</a></c:if>
                            <c:if test="${o.ostatus == 1 }">已付款</c:if>
                            <c:if test="${o.ostatus == 2 }"><a
                                    style="color:blue"
                                    href="${pageContext.request.contextPath}/orders/confirm/${o.oid}">
                                确认收货</a></c:if>
                            <c:if test="${o.ostatus == 3 }"><a
                                    style="color:red">已完成
                            </a></c:if>
                        </th>
                        <th colspan="2">金额:${o.ototal}元</th>
                    </tr>
                    <tr class="warning">
                        <th>图片</th>
                        <th>商品</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>小计</th>
                    </tr>
                    <c:forEach items="${oi}" var="oi"
                               varStatus="loop">
                        <c:if test="${oi.oid==o.oid}">
                            <tr class="active">
                                <td width="60" width="40%">
                                    <input type="hidden" name="id" value="22">
                                    <img src="/${pro[loop.count-1].pimg}"
                                         width="70" height="60">
                                </td>
                                <td width="30%">
                                    <a href="${pageContext.request.contextPath}/product/findProduct/${pro[loop.count-1].pid}"
                                       target="_blank">
                                            ${pro[loop.count-1].pname}</a>
                                </td>
                                <td width="20%">
                                    ￥ ${pro[loop.count-1].pprice}
                                </td>
                                <td width="10%">
                                        ${oi.count}
                                </td>
                                <td width="15%">
                                    <span class="subtotal">￥ ${oi.total}</span>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    <tr>
                        <th colspan="2">
                            地址：${o.addr}
                        </th>
                        <th colspan="1">
                            收件人：${o.receiver}
                        </th>
                        <th colspan="2">
                            电话：${o.tel}
                        </th>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<%--分页按钮--%>
<div style="width:380px;margin:0 auto;margin-top:50px;">
    <ul class="pagination" style="text-align:center; margin-top:10px;">

        <!-- 如果是第一页，就把箭头禁掉 -->
        <c:if test="${od.pageNumber == 1 }">
            <li class="disabled">
                <a href="javascript:void(0)" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>

        <!-- 不是第一页就点击向前一页 -->
        <c:if test="${od.pageNumber != 1 }">
            <li>
                <a
                        href="${pageContext.request.contextPath }/orders/findPage/${od.pageNumber-1}&${uid}"
                        aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>

        <!-- 展示所有页码 -->
        <c:forEach begin="1" end="${od.totalPage }" var="n">
            <!-- 是当前页就不能点击 -->
            <c:if test="${od.pageNumber == n }">
                <li class="active"><a href="javascript:void(0)">${n }</a>
                </li>
            </c:if>
            <%--不是当前页就可以点击相应的页数--%>
            <c:if test="${od.pageNumber != n }">
                <li>
                    <a
                            href="${pageContext.request.contextPath }/orders/findPage/${n}&${uid}">${n }</a>
                </li>
            </c:if>
        </c:forEach>

        <!-- 如果是最后一页，就把箭头禁掉 -->
        <c:if test="${od.pageNumber == od.totalPage }">
            <li class="disabled">
                <a href="javascript:void(0)" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>

        <%--不是最后一页就往后跳一页--%>
        <c:if test="${od.pageNumber != od.totalPage }">
            <li>
                <a
                        href="${pageContext.request.contextPath }/orders/findPage/${od.pageNumber+1}&${uid}"
                        aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>

    </ul>
</div>
<%--分页结束--%>

<%--静态包含--%>
<%@include file="/jsp/foot.jsp" %>
</body>

</html>