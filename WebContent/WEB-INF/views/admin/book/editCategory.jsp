<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .form-group{
        margin-top: 10px;
    }
</style>
<div class="bjui-pageContent">
    <div id="dialog_category" data-noinit="true">
        <input type="hidden" id="cid" name="cid" value="${category.cid}">
        <div class="form-group">
            <label for="cname" class="control-label x85"> 分类名称：</label>
            <input id="cname" type="text" placeholder="分类名称" value="${category.cname}" name="cname"  class="form-control validate[required] required" aria-required="true" >
        </div>
        <div class="form-group">
            <label for="description" class="control-label x85">分类描述：</label>
            <textarea rows="6"  id="description" placeholder="分类描述" name="description" class="form-control">${category.description}</textarea>
        </div>
        <div class="form-group">
            <label for="pid" class="control-label x85">所属分类：</label>
            <select name="pid" id="pid">
                <option value="" <c:if test='${empty category.pid }'>selected</c:if>>顶级分类</option>
                <c:forEach items="${categoryList }" var="onecategory">
                    <option value="${onecategory.cid}" <c:if test='${onecategory.cid eq category.pid}'>selected</c:if>>${onecategory.cname}</option>
                </c:forEach>
            </select>
        </div>
    </div>
</div>