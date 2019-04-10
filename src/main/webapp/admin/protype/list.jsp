<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/Style1.css"
          rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #menuContent a {
            text-decoration: none;
            color: #ffffff
        }

        .c {
            border-style: solid;
            width: 200px;
            height: 130px;
            margin: 4px 23px 0px 23px;
            border-radius: 5px;
            display: block;
            background: #fff;
            margin: 10% auto;
        }

        .mask {
            width: 100%;
            height: 100%;
            position: fixed;
            background: rgba(0, 0, 0, .3);
            display: none;
        }
    </style>
</HEAD>
<body>
<br>
<div class="mask">
    <div class="c">
        <div style="background-color:#afd1f3;height:20px;color:#fff;font-size:12px;padding-left:7px;">
            修改信息<font style="float:right;padding-right: 10px;"
                      onclick="cancelEdit()">x</font>
        </div>
        <form id="editForm"
              action="${pageContext.request.contextPath}/adprotype/edit"
              method="post"
              onclick="return validate()">
            分类名称：<input type="text" id="editName" name="ptname"
                        style="width:120px"/> <br/>
            状态：<select id="eStatus" name="ptstatus">
            <option value="1">启用</option>
            <option value="0">停用</option>
        </select><br/>
            <input type="hidden" id="editId" name="ptid"/>
            <%--<input type="hidden" id="editStatus" name="ptstatus"/>--%>
            <input type="submit" value="提交"
                   style="background-color:#afd1f3;color:#ffffff;width:70px;"/>
        </form>
    </div>
</div>
<table cellSpacing="1" cellPadding="0" width="100%" align="center"
       bgColor="#f5fafe" border="0">
    <TBODY>
    <tr>
        <td class="ta_01" align="center" bgColor="#afd1f3">
            <strong>分类列表</strong>
        </TD>
    </tr>
    <tr>
        <td class="ta_01" align="center" bgColor="#f5fafe">
            <table cellspacing="0" cellpadding="1" rules="all"
                   bordercolor="gray" border="1" id="DataGrid1"
                   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                <tr
                        style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                    <td align="center" width="15%">
                        序号
                    </td>
                    <td align="center" width="20%">
                        分类名称
                    </td>
                    <td align="center" width="15%">
                        状态
                    </td>
                    <td align="center" width="10%">
                        编辑
                    </td>
                    <td align="center" width="10%">
                        删除
                    </td>
                </tr>
                <c:forEach var="c" items="${protypes}"
                           varStatus="vs">
                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="18%">
                                ${vs.count}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="17%">
                                ${c.ptname}
                        </td>
                        <td align="center">
                            <c:if test="${c.ptstatus=='1'}">
                                <font color="blue">启用</font>
                            </c:if>
                            <c:if test="${c.ptstatus=='0'}">
                                <font color="red">停用</font>
                            </c:if>
                        </td>
                        <td align="center" style="HEIGHT: 22px">
                            <a onclick="showDetail('${c.ptid}')">
                                <img src="${pageContext.request.contextPath}/images/i_edit.gif"
                                     border="0" style="CURSOR: hand">
                            </a>
                        </td>

                        <td align="center" style="HEIGHT: 22px">
                            <a href="${ pageContext.request.contextPath}/adprotype/delete/${c.ptid}">
                                <img src="${pageContext.request.contextPath}/images/i_del.gif"
                                     width="16" height="16" border="0"
                                     style="CURSOR: hand">
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    </TBODY>
</table>


<script type="text/javascript">
    function showDetail(ptid) {
        var message = "{'ptid':'" + ptid + "'}";
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/adprotype/findPtById',
            contentType: 'application/json;charset=utf-8',
            data: message,//数据格式是json串
            success: function (data) {//返回json结果
                $("#editName").val(data["ptname"]);
                $("#editId").val(data["ptid"]);
                $("#eStatus").val(data["ptstatus"]);
                //显示弹出框
                $(".mask").css("display", "block");
            }
        });
    }

    function cancelEdit() {
        $(".mask").css("display", "none");
    }


    function validate() {
        if (document.getElementById("editName").value == "") {
            alert("分类名称不能为空");
            document.getElementById("editName").focus();
            return false;
        }
        return true;
    }
</script>
</body>


</HTML>

