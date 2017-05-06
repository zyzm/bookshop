<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>结果详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${ctx}/res/css/msg.css">
  </head>
<style type="text/css">
	body {background: rgb(254,238,189);}
</style>
  <body>
<c:choose>
  	<c:when test="${status eq '1' }">
  		<c:set var="img" value="${ctx}/res/images/duihao.jpg"/>
  		<c:set var="title" value="成功"/>
  	</c:when>
  	<c:when test="${status eq '0' }">
  		<c:set var="img" value="${ctx}/res/images/cuohao.png"/>
  		<c:set var="title" value="失败"/>
  	</c:when>
  </c:choose>
<div class="divBody">
	<div class="divTitle">
		<span class="spanTitle">${title }</span>
	</div>
	<div class="divContent">
	  <div style="margin: 20px;">
		<img style="float: left; margin-right: 30px;" src="<c:url value='${img }'/>" width="150"/>
		<span style="font-size: 30px; color: #c30; font-weight: 900;">${msg }</span>
		<br/>
		<br/>
		<br/>
		<br/>
		<span style="margin-left: 50px;"><a target="_top" href="${ctx}/admin">登录</a></span>
	  </div>
	</div>
</div>


  </body>
</html>
