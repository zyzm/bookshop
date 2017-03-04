<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>pwd.jsp</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/css.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/user/pwd.css">
</head>

<body oncontextmenu=" return false">
<div class="div0">
    <span>修改密码</span>
</div>

<div class="div1">
    <form target="_top">
        <table>
            <tr>
                <td><label class="error">${msg }</label></td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td align="right">原密码:</td>
                <td><input class="input" type="password" name="loginpass" id="loginpass" value="" autocomplete="false"/></td>
                <td><label id="loginpassError" class="error"></label></td>
            </tr>
            <tr>
                <td align="right">新密码:</td>
                <td><input class="input" type="password" name="newpass" id="newpass" value=""/></td>
                <td><label id="newpassError" class="error"></label></td>
            </tr>
            <tr>
                <td align="right">确认密码:</td>
                <td><input class="input" type="password" name="renewpass" id="renewpass" value=""/></td>
                <td><label id="renewpassError" class="error"></label></td>
            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <img style="cursor:pointer;" id="vCode" src="${ctx}/img/authImg?rand='+Math.random()+'" onclick="this.src='${ctx}/img/authImg?r='+Math.random()"
                         border="1"/>
                </td>
            </tr>
            <tr>
                <td align="right">验证码:</td>
                <td>
                    <input class="input" type="text" name="vcode" id="vcode" value=""/>
                </td>
                <td><label id="verifyCodeError" class="error"></label></td>
            </tr>
            <tr>
                <td align="right"></td>
                <td><input id="submit" style="cursor: pointer;" type="button" value="修改密码"/></td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">var ctx = "${ctx}";</script>
<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script src="${ctx}/res/js/common.js"></script>
<script type="text/javascript" src="${ctx}/res/js/user/pwd.js"></script>
</body>
</html>
