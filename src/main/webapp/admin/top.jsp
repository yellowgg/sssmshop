<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        BODY {
            MARGIN: 0px;
            BACKGROUND-COLOR: #ffffff
        }

        BODY {
            FONT-SIZE: 12px;
            COLOR: #000000
        }

        TD {
            FONT-SIZE: 12px;
            COLOR: #000000
        }

        TH {
            FONT-SIZE: 12px;
            COLOR: #000000
        }
    </style>
    <link href="${pageContext.request.contextPath}/css/Style1.css"
          rel="stylesheet" type="text/css">
</HEAD>
<body>
<table width="100%" height="70%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="100%"
            background="${pageContext.request.contextPath}/images/top_100.jpg">
        </td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="30" valign="bottom"
            background="${pageContext.request.contextPath}/images/mis_01.jpg">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="85%" align="left">
                        <div id="show"/>
                    </td>
                    <td width="15%">
                        <table width="100%" border="0" cellspacing="0"
                               cellpadding="0">
                            <tr>
                                <td width="200" valign="bottom">
                                    用户名：
                                    <font color="blue">${admin.name}</font>
                                </td>
                                <td width="155" valign="bottom">
                                    <a target="_top"
                                       href="${pageContext.request.contextPath}/admin/loginOut">退出</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="right" width="5%">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
<script type="text/javascript">
    window.onload = function () {
        var show = document.getElementById("show");
        setInterval(function () {
            var time = new Date();   // 程序计时的月从0开始取值后+1
            var m = time.getMonth() + 1;
            var t = time.getFullYear() + "-" + m + "-"
                + time.getDate() + " " + time.getHours() + ":"
                + time.getMinutes() + ":" + time.getSeconds();
            show.innerHTML = t;
        }, 1000);
    };
</script>
</HTML>
