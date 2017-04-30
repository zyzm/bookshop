<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>book_desc.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="${ctx}/res/admin/css/book/desc.css">
	<link href="${ctx}/res/lib/css/dpl-min.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/res/lib/css/bui-min.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body style="height: 620px;margin-left: 20px;margin-top: 20px;">
    <input type="checkbox" id="box" style="height: 20px;width: 20px;"><label for="box" style="font-weight: blob;color: red; font-size: 16px;">编辑或删除</label>
    <br/>
  <div id="show">
    <div class="sm">${book.bname}</div>
    <img align="top" src="${ctx}${book.image_w}" class="tp"/>
    <div id="book" style="float:left;margin-left: 20px;">
	    <ul>
	    	<li>商品编号：${book.bid}</li>
	    	<li>当前价：<span class="price_n">&yen;${book.currPrice }</span></li>
	    	<li>定价：<span style="text-decoration:line-through;">&yen;${book.price}</span>　折扣：<span style="color: #c30;">${book.discount}</span>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					作者：${book.author}
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：${book.press}</a>
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：${book.publishtime}</td>
			</tr>
			<tr>
				<td>版次：${book.edition}</td>
				<td>页数：${book.pageNum}</td>
				<td>字数：${book.wordNum}</td>
			</tr>
			<tr>
				<td width="180">印刷时间：${book.printtime}</td>
				<td>开本：${book.booksize }开</td>
				<td>纸张：${book.paper }</td>
			</tr>
		</table>
	</div>
  </div>
  
  
  <div id='formDiv' style="display: none;">
   <form action="" method="post" id="form">
   	<input type="hidden" name="book.bid" value="${book.bid}"/>
   	<input type="hidden" name="book.image_w" value="${book.image_w}"/>
   	<input type="hidden" name="book.image_b" value="${book.image_b}"/>
    <img align="top" src="${ctx}${book.image_w}" class="tp"/>
    <div style="color: blue;">
	    <ul>
	    	<li >商品编号：<span style="color:red;">${book.bid}</span></li>
	    	<li>
	    	<div style="float: left;width: 60px;">书名：</div>
	    	<div><textarea title="书籍描述"  style="width:500px;overflow:auto;"   id="bname" rows="5" cols="40" name="book.bname">${book.bname}</textarea></div>
	    	</li>
	    	<li>当前价：<input id="currPrice" type="text" name="book.currPrice" value="${book.currPrice}" style="width:50px;"/></li>
	    	<li>定价：　<input id="price" type="text" name="book.price" value="${book.price}" style="width:50px;"/>
	    	折扣：<input id="discount" type="text" name="book.discount" value="${book.discount}" style="width:30px;"/>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab" style="color:blue;">
			<tr>
				<td colspan="3">
					作者：　　<input id="author" type="text" name="book.author" value="${book.author}" style="width:150px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：　<input id="press" type="text" name="book.press" value="${book.press}" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：<input class="calendar" id="publishtime" type="text" name="book.publishtime" value="${book.publishtime}" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>版次：　　<input id="edition" type="text" name="book.edition" value="${book.edition}" style="width:40px;"/></td>
				<td>页数：　　<input id="pageNum" type="text" name="book.pageNum" value="${book.pageNum }" style="width:50px;"/></td>
				<td>字数：　　<input id="wordNum" type="text" name="book.wordNum" value="${book.wordNum }" style="width:80px;"/></td>
			</tr>
			<tr>
				<td width="250px">印刷时间：<input id="printtime" class="calendar"  type="text" name="book.printtime" value="${book.printtime }" style="width:100px;"/></td>
				<td width="250px">开本：　　<input id="booksize" type="text" name="book.booksize" value="${book.booksize }" style="width:100px;"/></td>
				<td>纸张：　　<input id="paper" type="text" name="book.paper" value="${book.paper }" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>
					一级分类：<select id="pid" onchange="loadChildren()">
						<c:forEach items="${levelOneCategoryList }" var="onecategory">
			    			<option value="${onecategory.cid}" <c:if test='${onecategory.cid eq book.pid}'>selected</c:if>>${onecategory.cname}</option>
			    		</c:forEach>
					</select>
				</td>
				<td>
					二级分类：<select name="book.cid" id="cid">
						<c:forEach items="${levelTwoCategoryList }" var="twocategory">
				    		<option <c:if test='${twocategory.cid eq book.cid}'>selected</c:if> value="${twocategory.cid}">${twocategory.cname}</option>
				    	</c:forEach>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">
					<input onclick="editForm()" style="cursor: pointer;" type="button" name="method" id="editBtn" class="btn editBtn1" value="编　　辑">
					<input onclick="delForm()" style="cursor: pointer;" type="button" name="method" id="delBtn" class="btn delBtn1" value="删　　除">
				</td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/lib/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/res/lib/bui/bui.js"></script>

	<script type="text/javascript">
		$(function() {
			BUI.use('bui/calendar',function(Calendar){
				var datepicker = new Calendar.DatePicker({
					trigger:'.calendar',
					autoRender : true
				});
			});
			// 操作和显示切换
			$("#box").click(function() {
				if($(this).prop("checked")) {
					$("#show").css("display", "none");
					$("#formDiv").css("display", "block");
				} else {
					$("#formDiv").css("display", "none");
					$("#show").css("display", "block");
				}
			});

			// 编辑和删除按钮样式
			$("#editBtn").hover(
					function() {
						$("#editBtn").removeClass("editBtn1");
						$("#editBtn").addClass("editBtn2");
					},
					function() {
						$("#editBtn").removeClass("editBtn2");
						$("#editBtn").addClass("editBtn1");
					}
			);
			$("#delBtn").hover(
					function() {
						$("#delBtn").removeClass("delBtn1");
						$("#delBtn").addClass("delBtn2");
					},
					function() {
						$("#delBtn").removeClass("delBtn2");
						$("#delBtn").addClass("delBtn1");
					}
			);
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
						var celem=$("<option>").attr('value',data[i]['cid']).text(data[i]['cname']);
						$(cidselect).append(celem);
					}
				},
				error:function(){
					alert('网络错误');
				}
			});
		}
		function editForm() {
			var bname = $("#bname").val();
			var currPrice = $("#currPrice").val();
			var price = $("#price").val();
			var discount = $("#discount").val();
			var author = $("#author").val();
			var press = $("#press").val();
			var pid = $("#pid").val();
			var cid = $("#cid").val();

			if(!bname || !currPrice || !price || !discount || !author || !press || !pid || !cid) {
				alert("图名、当前价、定价、折扣、作者、出版社、1级分类、2级分类不能为空！");
				return false;
			}

			if(isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
				alert("当前价、定价、折扣必须是合法小数！");
				return false;
			}

			$("#form").attr("action","${ctx}/admin/book/editBook");
			$("#form").submit();
		}

		function delForm() {
			$("#form").attr("action","${ctx}/admin/book/delBook");
			$("#form").submit();
		}
	</script>
  </body>
</html>
