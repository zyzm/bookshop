<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>图书列表</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/book/list.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/res/thrid/laypage/skin/laypage.css"/>
</head>
<body>
<c:if test="${not empty page.list}">
    <ul cid="${cid}">
        <c:forEach items="${page.list}" var="book">
            <li>
                <div class="inner">
                    <a class="pic" title="${book.bname}"
                       href="${ctx}/admin/book/editView?bid=${book.bid }"><img class="book"
                                                                                        src="${ctx}/${book.imageB}"
                                                                                        border="0"/></a>
                    <p class="price">
                        <span class="price_n">&yen;${book.currPrice}</span>
                        <span class="price_r">&yen;${book.price}</span>
                        (<span class="price_s">${book.discount}折</span>)
                    </p>
                    <p><a id="bookname" title="${book.bname}"
                          href="<c:url value='/book/findBookById?bid=${book.bid }'/>">${book.bname}</a></p>
                    <c:url value="/book/findBookByAuthor" var="authorurl">
                        <c:param name="author" value="${book.author}"></c:param>
                    </c:url>
                    <c:url value="/book/findBookByPress" var="pressUrl">
                        <c:param name="press" value="${book.press}"></c:param>
                    </c:url>
                    <p><a href="${authorurl}" name='P_zz' title='${book.author}'>${book.author}</a></p>
                    <p class="publishing">
                        <span>出 版 社：</span><a href="${pressUrl}">${book.press}</a>
                    </p>
                    <p class="publishing_time"><span>出版时间：</span>${book.publishtime}</p>
                </div>
            </li>
        </c:forEach>
    </ul>
    <div style="float:left; width: 100%; text-align: center;">
        <br/>
        <input type="hidden" name="totalPage" value="${totalPage}" id="totalPage">
        <div id="pager"></div>
    </div>
</c:if>

<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/res/thrid/laypage/laypage.js"></script>
<script type="text/javascript" src="${ctx}/res/js/book/list.js"></script>
</body>
</html>