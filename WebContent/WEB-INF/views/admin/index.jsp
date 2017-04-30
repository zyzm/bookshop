<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/res/lib/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/res/lib/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/res/lib/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="header">

		<div class="dl-title">
			<p style="font-size: 26px;color: #fff;font-weight: bold;margin-top: 15px;margin-left: 10px">网上图书商城后台管理系统</p>
		</div>

		<div class="dl-log">
			欢迎您，<span class="dl-log-user">${sessionScope.admin.adminname}</span>
			<a href="${ctx}/admin/login/logout" title="退出系统" class="dl-log-quit">[退出]</a>
		</div>
	</div>
	<div class="content">
		<div class="dl-main-nav">
			<div class="dl-inform">
				<div class="dl-inform-title">
					<s class="dl-inform-icon dl-up"></s>
				</div>
			</div>
			<ul id="J_Nav" class="nav-list ks-clear">
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-home">系统管理</div></li>
			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten">

		</ul>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/lib/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/res/lib/bui/bui.js"></script>
	<script type="text/javascript" src="${ctx}/res/lib/js/main-min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/lib/js/config-min.js"></script>
	<script>
		BUI.use('common/main', function() {
			var config = [ {
				id : '1',
				menu : [ {
					text : '商城管理',
					items : [ {
						id : '12',
						text : '图书管理',
						href : '${ctx}/admin/book'
					}, {
						id : '3',
						text : '新增图书',
						href : '${ctx}/admin/book/addView'
					}, {
						id : '4',
						text : '订单管理',
						href : '${ctx}/admin/order/findAll'
					}]
				} ]
			}];
			new PageUtil.MainPage({
				modulesConfig : config
			});
		});
	</script>
</body>
</html>