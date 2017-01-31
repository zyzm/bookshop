<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
	var ctx = "${ctx}";
</script>
<script type="text/javascript"
	src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/res/js/common.js"></script>
<script type="text/javascript" src="${ctx}/res/js/user/regist.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<link href="${ctx}/res/css/user/login2013.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="${ctx}/res/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/res/css/user/regist.css">
</head>

<body>
	<div class="head divBody">
		<input id="contextpath" type="hidden" readonly="readonly"
			value="<c:url value='/'/>" /> 
	    <a href="${ctx}/"><img src="${ctx}/res/images/logo.png"> </a>
		<ul class="clearfix">
			<li class="n1"><a href="javascript:void(0);">货到付款</a></li>
			<li class="n2"><a href="javascript:void(0);">正品保障</a></li>
			<li class="n3"><a href="javascript:void(0);">上门退款</a></li>
		</ul>
	</div>
	<div class="divBody">
		<div class="divTitle">
			<span class="spanTitle">新用户注册</span>
		</div>
		<div class="divCenter">
			<form onsubmit="return false">
				<table>
					<tr>
						<td class="tdLabel">用户名：</td>
						<td class="tdInput"><input type="text" name="loginname"
							autocomplete="off" id="loginname" class="input" value="" /></td>
						<td class="tdError"><label class="labelError"
							id="loginnameError">请输入邮箱/用户名/手机号码</label></td>
					</tr>
					<tr>
						<td class="tdLabel">登录密码：</td>
						<td class="tdInput"><input onfocus="this.type='password'"
							autocomplete="off" name="loginpass" id="loginpass" class="input"
							value="" /></td>
						<td class="tdError"><label class="labelError"
							id="loginpassError"></label></td>
					</tr>
					<tr>
						<td class="tdLabel">确认密码：</td>
						<td class="tdInput"><input onfocus="this.type='password'"
							autocomplete="off" name="reloginpass" id="reloginpass"
							class="input" value="" /></td>
						<td class="tdError"><label class="labelError"
							id="reloginpassError"></label></td>
					</tr>
					<tr>
						<td class="tdLabel">Email：</td>
						<td class="tdInput"><input type="text" name="email"
							id="email" class="input" value="" /></td>
						<td class="tdError"><label class="labelError" id="emailError"></label>
						</td>
					</tr>
					<tr>
						<td class="tdLabel">图形验证码：</td>
						<td class="tdInput">
							<div class="code" id="vcode_model" style="float: left">
								<input type="text" name="verifyCode" id="verifyCode"
									class="vInput" value="" />
							</div> <img id="vCode" src="${ctx}/img/authImg?rand='+Math.random()+'"
							onclick="this.src='${ctx}/img/authImg?r='+Math.random()"
							style="margin-left: 5px; cursor: pointer; height: 36px; width: 103px;" />
						</td>
						<td class="tdError"><label class="labelError"
							id="verifyCodeError"></label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><img src="${ctx}/res/images/regist1.jpg" id="submit"
							style="cursor: pointer;" /></td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>
