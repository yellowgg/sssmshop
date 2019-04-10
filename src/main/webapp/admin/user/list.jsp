<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/Style1.css"
          rel="stylesheet" type="text/css"/>
</HEAD>
<body>
<br>
<table cellSpacing="1" cellPadding="0" width="100%" align="center"
       bgColor="#f5fafe" border="0">
    <TBODY>
    <tr>
        <td class="ta_01" align="center" bgColor="#afd1f3">
            <strong>用户列表</strong>
        </TD>
    </tr>
    <tr>

    </tr>
    <tr>
        <td class="ta_01" align="center" bgColor="#f5fafe">
            <table cellspacing="0" cellpadding="1" rules="all"
                   bordercolor="gray" border="1" id="DataGrid1"
                   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                <tr
                        style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                    <td align="center" width="18%">
                        序号
                    </td>
                    <td align="center" width="17%">
                        用户名称
                    </td>
                    <td align="center" width="17%">
                        真实姓名
                    </td>
                    <td align="center" width="17%">
                        邮箱
                    </td>
                </tr>
                <c:forEach var="c" items="${users}" varStatus="vs">
                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px"
                            align="center"
                            width="18%">
                                ${vs.count}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px"
                            align="center"
                            width="17%">
                                ${c.username}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px"
                            align="center"
                            width="17%">
                                ${c.name}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px"
                            align="center"
                            width="17%">
                                ${c.email}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    </TBODY>
</table>
</body>
</HTML>

