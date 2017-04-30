<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>图书详细</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/book/desc.css">
</head>
<body>
<div class="divBookName">${book.bname}</div>
<div>
    <img title="${book.bname}" align="top" src="${ctx}/${book.imageW}" class="img_image_w"/>
    <div class="divBookDesc">
        <ul>
            <li>商品编号:${book.bid}</li>
            <li>商城价：<span class="price_n">&yen;${book.currPrice }</span></li>
            <li>定价：<span class="spanPrice">&yen;${book.price }</span>　折扣：<span
                    style="color: #c30;">${book.discount }</span>折
            </li>
        </ul>
        <hr class="hr1"/>
        <table>
            <tr>
                <td colspan="3">
                    作者：${book.author } 著
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    出版社：${book.press }
                </td>
            </tr>
            <tr>
                <td colspan="3">出版时间：${book.publishtime }</td>
            </tr>
            <tr>
                <td>版次：${book.edition }</td>
                <td>页数：${book.pageNum }</td>
                <td>字数：${book.wordNum }</td>
            </tr>
            <tr>
                <td width="180">印刷时间：${book.printtime }</td>
                <td>开本：${book.booksize } 开</td>
                <td>纸张：${book.paper }</td>
            </tr>
        </table>
        <div class="divForm">
            <form id="form1" action="${ctx}/cart/buy" method="post">
                <input type="hidden" name="cartitem.bid" value="${book.bid }"/>
                我要买：<a style="cursor:pointer;" class="jian" id="12345Jian"></a><input id="cnt"
                                                                                      style="width: 40px;text-align: center;"
                                                                                      type="text"
                                                                                      name="cartitem.quantity"
                                                                                      value="1"/><a
                    style="cursor:pointer;" class="jia" id="12345Jia"></a>件
            </form>
            <a id="btn" href="javascript:$('#form1').submit();"></a>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script src="${ctx}/res/js/book/desc.js"></script>
</body>
</html>
