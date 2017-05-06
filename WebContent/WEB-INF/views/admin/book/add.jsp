<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'bookdesc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
  	<!--<link rel="stylesheet" type="text/css" href="${ctx}/res/admin/css/book/add.css">-->
  	<link href="${pageContext.request.contextPath}/res/lib/css/dpl-min.css" rel="stylesheet" type="text/css" />
  	<link href="${pageContext.request.contextPath}/res/lib/css/bui-min.css" rel="stylesheet" type="text/css" />
  	<style>
	  .ui-datepicker
	  {
		  width:185px;
	  }
  	</style>
  </head>
  <body>
  <div>
   <p style="font-weight: 900; color: red;">${msg}</p>
   <form class="form-horizontal" action="${ctx}/admin/book/addBook" enctype="multipart/form-data" method="post" id="form">
		<div class="control-group">
			<label class="control-label">书名：</label>
			<div class="controls">
				<input type="text" class="input-large" id="bname" name="bname" style="width:500px;"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大图：</label>
			<div class="controls">
				<input type="file" class="input-middle" id="image_w" name="image"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小图：</label>
			<div class="controls">
				<input type="file" class="input-middle" id="image_b" name="image"/>
			</div>
		</div>
		<div class="row">
			<div class="control-group span6">
				<label class="control-label">定价：</label>
				<div class="controls">
					<input type="text" class="input-small" id="price" name="price" />
				</div>
			</div>
			<div class="control-group span7">
				<label class="control-label">折扣：</label>
				<div class="controls">
					<input type="text" class="input-small" id="discount" name="discount"/>折
				</div>
			</div>
			<div class="control-group span6">
				<label class="control-label">当前价：</label>
				<div class="controls">
					 <input type="text" class="input-small" id="currPrice" name="currPrice" readOnly="true" value=/> 
				</div>
			</div>
		</div>

	   <div class="control-group"><hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/></div>
	   <div class="control-group">
		   <label class="control-label">作者：</label>
		   <div class="controls">
			   <input type="text" class="input-middle" id="author" name="author"/>
		   </div>
	   </div>
	   <div class="row">
		   <div class="control-group span8">
			   <label class="control-label">出版社：</label>
			   <div class="controls">
				   <input type="text" class="input-middle" id="press" name="press" />
			   </div>
		   </div>
		   <div class="control-group span8">
			   <label class="control-label">出版时间：</label>
			   <div class="controls">
				   <input type="text" class="input-middle calendar" id="publishtime" name="publishtime"/>
			   </div>
		   </div>
	   </div>
	   <div class="row">
		   <div class="control-group span8">
			   <label class="control-label">版次：</label>
			   <div class="controls">
				   <input type="text" class="input-middle" id="edition" name="edition" />
			   </div>
		   </div>
		   <div class="control-group span6">
			   <label class="control-label">页数：</label>
			   <div class="controls">
				   <input type="text" class="input-small" id="pageNum" name="pageNum"/>
			   </div>
		   </div>
		   <div class="control-group span8">
			   <label class="control-label">字数：</label>
			   <div class="controls">
				   <input type="text" class="input-small" id="wordNum" name="wordNum"/>
			   </div>
		   </div>
   		</div>
	   <div class="row">
		   <div class="control-group span8">
			   <label class="control-label">印刷时间：</label>
			   <div class="controls">
				   <input type="text" class="input-middle calendar" id="printtime" name="printtime" style="width: 140px;"/>
			   </div>
		   </div>
		   <div class="control-group span6">
			   <label class="control-label">开本：</label>
			   <div class="controls">
				   <input type="text" class="input-small" id="booksize" name="booksize"/>
			   </div>
		   </div>
		   <div class="control-group span8">
			   <label class="control-label">纸张：</label>
			   <div class="controls">
				   <input type="text" class="input-small" id="paper" name="paper"/>
			   </div>
		   </div>
	   </div>
	   <div class="row">
		   <div class="control-group span8">
			   <label class="control-label">一级分类：</label>
			   <div class="controls">
				   <select id="pid" onchange="loadChildren()">
					   <option value="">请选择一级分类</option>
					   <c:forEach items="${categoryList }" var="onecategory">
						   <option value="${onecategory.categoryid}">${onecategory.categoryName}</option>
					   </c:forEach>
				   </select>
			   </div>
		   </div>
		   <div class="control-group span8">
			   <label class="control-label">二级分类：</label>
			   <div class="controls">
				   <select name="cid" id="cid">
					   <option>请先选择一级分类</option>
				   </select>
			   </div>
		   </div>
	   </div>
	   <div class="row">
		   <div class="form-actions offset3">
			   <button id="btn" type="button" class="button button-primary">新书上架</button>
			   <button type="reset" class="button">重置</button>
		   </div>
	   </div>
   </form>
  </div>
  <script type="text/javascript" src="${pageContext.request.contextPath}/res/lib/js/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${ctx}/res/lib/bui/bui.js"></script>
  

  <script type="text/javascript">
	  $(function () {
		  BUI.use('bui/calendar',function(Calendar){
			  var datepicker = new Calendar.DatePicker({
				  trigger:'.calendar',
				  autoRender : true
			  });
		  });
		  $("#btn").addClass("btn1");
		  $("#btn").hover(
				  function() {
					  $("#btn").removeClass("btn1");
					  $("#btn").addClass("btn2");
				  },
				  function() {
					  $("#btn").removeClass("btn2");
					  $("#btn").addClass("btn1");
				  }
		  );

		  function setCurrPrice()
		  {
			  var price = $("#price").val();
			  var discount = $("#discount").val();
			  var c=price*discount/10;
			  $("#currPrice").val(c);
		  }
		  
		  $("#price").blur(setCurrPrice);
		  $("#discount").blur(setCurrPrice);
		  
		  $("#btn").click(function() {
			  var bname = $("#bname").val();
			  var currPrice = $("#currPrice").val();
			  var price = $("#price").val();
			  var discount = $("#discount").val();
			  var author = $("#author").val();
			  var press = $("#press").val();
			  var pid = $("#pid").val();
			  var cid = $("#cid").val();
			  var image_w = $("#image_w").val();
			  var image_b = $("#image_b").val();

			  //|| !currPrice||currPrice==''   isNaN(currPrice) || 
			  if(!bname||bname=='' || !price||price=='' || !discount || !author||author=='' || !press||press=='' || !pid||pid=='' || !cid||cid=='' || !image_w||image_w=='' || !image_b||image_b=='') {
				  alert("图名、当前价、定价、折扣、作者、出版社、1级分类、2级分类、大图、小图都不能为空！");
				  return false;
			  }
			  if(isNaN(price) || isNaN(discount)||discount<0.0||discount>(10.0)) {
				  alert("当前价、定价、折扣必须是合法小数！");
				  return false;
			  }
			  $("#form").submit();
		  });
	  });
	  
	 
	  
	  function loadChildren()
	  {
		  var pid=$('#pid').val();
		  var cidselect=$("#cid").empty();
		  if(!pid||pid=='')
		  {
			  var _celem=$("<option>").text("请先选择一级分类");
			  $(cidselect).append(_celem);
			  return;
		  }
		  $.ajax({
			  url:"${ctx}/admin/category/findChildCategory",
			  type:'POST',
			  data:{'pid':pid},
			  success:function(data)
			  {
				  if(data.length==0)
				  {
					  var celem=$("<option>").text("请先添加二级分类");
					  $(cidselect).append(celem);
					  return;
				  }
				  for(var i=0;i<data.length;i++)
				  {
					  var celem=$("<option>").attr('value',data[i]['categoryid']).text(data[i]['categoryName']);
					  $(cidselect).append(celem);
				  }
			  },
			  error:function(){
				  alert('网络错误');
			  }
		  });
	  }
  </script>
  </body>
</html>
