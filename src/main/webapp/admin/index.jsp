<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台管理系统登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body background="${pageContext.request.contextPath}/image/body_img.jpg">
<form method="post" action="${pageContext.request.contextPath }/admin/login"
      target="_parent" name='theForm' onsubmit="return validate()">
    <table cellspacing="0" cellpadding="0" style="margin-top: 100px"
           align="center">
        <tr>
            <td style="padding-left: 50px">
                <table>
                    <tr>
                        <td>管理员姓名：</td>
                        <td><input type="text" id="username"
                                   name="username"/></td>
                    </tr>
                    <tr>
                        <td>管理员密码：</td>
                        <td><input type="password" id="password"
                                   name="password"/></td>
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <c:if test="${errorMsg!=null}">
                                <div align="center"
                                     style="color: red">${errorMsg}</div>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><input type="submit" value="进入管理中心" class="button"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
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