<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
    <LINK href="${pageContext.request.contextPath}/css/Style1.css"
          type="text/css" rel="stylesheet">
</HEAD>

<body>
<form id="userAction_save_do" name="Form1"
      action="${pageContext.request.contextPath}/adproduct/addProduct"
      method="post"
      enctype="multipart/form-data">
    &nbsp;
    <table cellSpacing="1" cellPadding="5" width="100%" align="center"
           bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                height="26">
                <strong><STRONG>添加商品</STRONG>
                </strong>
            </td>
        </tr>

        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                商品名称：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input required="required" type="text" name="pname" value=""
                       id="userAction_save_do_logonName1" class="bg"/>
            </td>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                是否热门：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <select name="pstatus">
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            </td>
        </tr>

        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                商品价格：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input required="required" type="text" name="pprice" value=""
                       id="userAction_save_do_logonName2" class="bg"/>
            </td>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                商品数量：
            </td>
            <td class="ta_01" bgColor="#ffffff">
                <input required="required" type="text" name="pcount" value=""
                       id="userAction_save_do_logonName3" class="bg"/>
            </td>
        </tr>

        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                商品图片：
            </td>
            <td class="ta_01" bgColor="#ffffff" colspan="3">
                <input required="required" type="file" name="file"
                       id="uploadImage"/>
                <p>温馨提示：只允许上传.jpg .png.jpeg 后缀的图片</p>
            </td>
        </tr>
        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                所属分类：
            </td>
            <td class="ta_01" bgColor="#ffffff" colspan="3">
                <select name="ptid">
                    <c:forEach items="${protypes}" var="c">
                        <option
                                value="${c.ptid}">${c.ptname}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                商品描述：
            </td>
            <td class="ta_01" bgColor="#ffffff" colspan="3">
                <textarea required="required" name="pdetailed" rows="5"
                          cols="30"></textarea>
            </td>
        </tr>

        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">
                <button onclick="return validate()" type="submit"
                        id="productSubmit" value="确定"
                        class="button_ok">
                    &#30830;&#23450;
                </button>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)"
                       value="返回"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    function validate() {
        var str = $("#uploadImage").val();
        var reg = ".*\\.(jpg|png|jpeg|JPG|PNG|JPEG)";
        var r = str.match(reg);
        if (str.length == 0) {
            alert("请选择图片");
            return false;
        } else if (r == null) {
            alert("对不起，您的图片格式不正确，请重新上传");
            return false;
        } else
            return true;
    }
</script>
</body>
</HTML>