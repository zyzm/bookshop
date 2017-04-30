<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>我的购物车</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/cart/list.css">
</head>
<body>
<c:choose>
    <c:when test="${empty cartItemList}">
        <table width="95%" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="right">
                    <img align="top" src="${ctx}/res/images/icon_empty.png"/>
                </td>
                <td>
                    <span class="spanEmpty">您的购物车中暂时没有商品</span>
                </td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        <table width="95%" align="center" cellpadding="0" cellspacing="0">
            <tr align="center" bgcolor="#efeae5">
                <td align="left" width="20px">
                    <input type="checkbox" id="selectAll" checked/>
                </td>
                <td align="left"><label for="selectAll" >全选</label></td>
                <td>商品名称</td>
                <td>单价</td>
                <td>数量</td>
                <td>小计</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${cartItemList}" var="item">
                <tr align="center">
                    <td align="left">
                        <input value="${item.cartItemId}" type="checkbox" name="cartItemId" checked="checked"/>
                    </td>
                    <td align="left" width="70px">
                        <a title="${item.book.bname}" class="linkImage" href="${ctx}/findBookById?bid=${item.book.bid}"><img
                                border="0" width="54" align="top" src="${ctx}/${item.book.imageB}"/></a>
                    </td>
                    <td align="left" width="400px">
                        <a title="${item.book.bname}"
                           href="<c:url value='/findBookById?bid=${item.book.bid}'/>"><span>${fn:substring(item.book.bname,0,48)}</span></a>
                    </td>
                    <td><span>&yen;<span class="currPrice">${item.book.currPrice}</span></span></td>
                    <td>
                        <a style="cursor:pointer;" class="jian"></a>
                        <input class="quantity" readonly="readonly" type="text" value="${item.quantity}"/>
                        <a style="cursor:pointer;" class="jia"></a>
                    </td>
                    <td width="100px">
                        <span class="price_n">&yen;<span class="subTotal">${item.subTotal}</span></span>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick="deleteOneCart(this)">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="4" class="tdBatchDelete">
                    <a href="javascript:deleteAll();">批量删除</a>
                </td>
                <td colspan="3" align="right" class="tdTotal">
                    <span>总计：</span><span class="price_t">&yen;<span id="total"></span></span>
                </td>
            </tr>
            <tr>
                <td colspan="7" align="right">
                    <a href="javascript:jiesuan()" id="jiesuan" class="jiesuan"></a>
                </td>
            </tr>
        </table>
        <form id="jiesuanform" action="${ctx}/cart/toBuy" method="post">
            <input type="hidden" name="cartItemIds" id="cartItemIds"/>
        </form>
    </c:otherwise>
</c:choose>
<script type="text/javascript">var ctx = "${ctx}";</script>
<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/res/js/round.js"></script>
<script type="text/javascript" src="${ctx}/res/js/cart/list.js"></script>
</body>
</html>
