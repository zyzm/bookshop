<%@ page language="java" pageEncoding="UTF-8" %>
<%@page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单列表</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/res/thrid/laypage/skin/laypage.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/order/list.css"/>
    <style type="text/css">
        body table {
            font-size: 12px;
        }

        table {
            table-layout: fixed;
            border-collapse: collapse;

        }

        .orderitemclass tr, .item2 {
            border: 1px solid #cad9ea;
            color: #666;
        }

        .orderitemclass a:hover {
            color: red;
        }
    </style>
</head>
<body>

<c:if test="${not empty page.list}">
    <div class="divMain">
        <div class="divTitle">
            <span style="margin-left: 150px; margin-right: 280px;">商品信息</span> <span
                style="margin-left: 40px; margin-right: 38px;">金额</span> <span
                style="margin-left: 50px; margin-right: 40px;">订单状态</span> <span
                style="margin-left: 50px; margin-right: 50px;">操作</span>
        </div>
        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
            <c:forEach items="${page.list}" var="order">
                <tr class="tt">
                    <td width="320px">订单号：<a
                            href="<c:url value='/order/findOrder?oid=${order.oid}'/>">${order.oid}</a>
                    </td>
                    <td width="210px">下单时间：${order.ordertime}</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="item2">
                    <td colspan="2">
                        <table class="orderitemclass">
                            <c:forEach items="${order.orderitems}" var="orderitem">
                                <tr>
                                    <td width="70px">
                                        <a class="link2" href="${ctx}/findBookById?bid=${orderitem.bid}"
                                           title="${orderitem.bname}">
                                            <img border="0" width="70" src="${ctx}/${orderitem.imageB}"/>
                                        </a>
                                    </td>
                                    <td align="left" width="220px">
                                        <a style="color:#36c;" href="${ctx}/findBookById?bid=${orderitem.bid}"
                                           title="${orderitem.bname}">
                                                ${fn:substring(orderitem.bname,0,52)}
                                        </a>
                                    </td>
                                    <td width="80px" align="center">${orderitem.currPrice}</td>
                                    <td width="80px">${orderitem.quantity}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td width="120px" align="left"><span class="price_t">&yen;${order.total}</span></td>
                    <td width="300px" class="item2" align="center">
				<span style="color:#066601;">
				<c:choose>
                    <c:when test="${order.status eq 1}">(等待付款)</c:when>
                    <c:when test="${order.status eq 2}">(准备发货)</c:when>
                    <c:when test="${order.status eq 3}">(确认收货)</c:when>
                    <c:when test="${order.status eq 4}">(交易成功)</c:when>
                    <c:when test="${order.status eq 5}">(交易关闭)</c:when>
                </c:choose>
				 </span>
                    </td>
                    <td class="item2" align="center" colspan="2" style="vertical-align: middle;">
                        <a href="${ctx}/order/findOrder?oid=${order.oid}">查看</a><br/><br>
					<span>
					<c:choose>
                        <c:when test="${order.status eq 1}">
                            <a href="${ctx}/order/findOrder?oid=${order.oid}">支付</a><br/><br>
                            <a href="javascript:void(0)" class="cancleorder" oid="${order.oid}">取消订单</a>
                        </c:when>
                        <c:when test="${order.status eq 3 }"><a href="javascript:void(0)" class="confirmorder"
                                                                oid="${order.oid}">确认收货</a></c:when>
                    </c:choose>
					</span>
                        <br/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <div id="pager"></div>
        <input type="hidden" name="totalPage" value="${totalPage}" id="totalPage"/>
    </div>
</c:if>
<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/res/thrid/laypage/laypage.js"></script>
<script type="text/javascript">
	$(function () { 
		 $(".cancleorder").click(function () {
	         if (confirm("确认取消订单吗?"))
	             updateOrder('cancleOrder', "(交易关闭)", this);
	     });
	     $(".confirmorder").click(function () {
	         if (confirm("确认收货吗?"))
	             updateOrder('confirmOrder', '(交易成功)', this);
	     });
	    var pager = $('#pager');
	    laypage({
	        cont: pager,
	        pages: parseInt( $('#totalPage').val()),
	   //  pages: parseInt( $('.totalPage:first').text()), //可以叫服务端把总页数放在某一个隐藏域，再获取。假设我们获取到的是18
	        skip: true, //是否开启跳页
	        skin: 'molv',
	        groups: 3, //连续显示分页数
	        curr: function () { //通过url获取当前页，也可以同上（pages）方式获取
	            var page = location.search.match(/pageNumber=(\d+)/);
	            return page ? page[1] : 1;
	        }(),
	        jump: function (e, first) { //触发分页后的回调
	            if (!first) { //一定要加此判断，否则初始时会无限刷新
	                var n = window.location.href.indexOf("?"),
	                    url;
	                if(n != -1){
	                    url = location.href.substring(0, n);
	                } else {  
	                    url = location.href;
	                }
	                location.href = url + '?pageNumber=' + e.curr;
	            }
	        }
	    });
	});

    function updateOrder(method, text, elem) {
        $.ajax({
            type: 'POST',
            data: {'oid': $(elem).attr('oid')},
            url: '${ctx}/order/' + method,
            success: function (data) {
                if (data.status == "1") {
                    $(elem).parent().parent().prev().children().text(text);
                    $(elem).parent().remove();
                    alert(data.msg);
                }
            },
            error: function () {
                alert("网络错误");
            }
        });
    }
</script>
</body>
</html>
