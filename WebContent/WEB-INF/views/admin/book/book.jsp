<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>基本的树</title>
    <link href="${pageContext.request.contextPath}/res/lib/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/res/lib/css/bui-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <!--   <div  style="top: 0px; bottom: 0px;min-height: 550px;">
        <div style="float:left; width:200px;">
            <ul id="tree_categories">
            </ul>
        </div>
        <div id="bookdiv" style="float: left">
            <iframe  id="book" name="books" noresize scrolling="yes" style="height:500px;width: 1000px;minoverflow: scroll;">

            </iframe>
        </div>

    </div> -->
    <div  style="top: 0px; bottom: 0px;" class="row-fluid">
        <div class="span5">
            <ul id="tree_categories">
            </ul>
        </div>
        <div id="bookdiv" class="span19 span-first">
            <iframe  id="book" name="books" noresize scrolling="yes" style="height:500px;width: 99.9%;overflow: scroll;">

            </iframe>
        </div>

    </div>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/res/lib/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="${ctx}/res/lib/bui/bui.js"></script>
<script type="text/javascript">var ctx = '${ctx}';</script>
<script type="text/javascript" src="${ctx}/res/admin/js/book.js"></script>
<style>
    #tree_categories{
        margin: 5px;;
    }
    .bui-tree-list{
        border: none;
    }
    .bui-tree-list .x-tree-elbow-expander,.icon-pkg,.icon-example,.task,.task-folder{
        background: url("${ctx}/res/lib/img/zTreeStandard.png");
    }

    .x-tree-show-line .x-tree-elbow-expander{
        background-position: -107px -1px;
    }
    .x-tree-show-line .x-tree-elbow-expander:hover{
        background-position: -107px -1px;
    }
    .x-tree-show-line .bui-tree-item-expanded .x-tree-elbow-expander{
        background-position: -165px -65px;
    }
    .x-tree-show-line .bui-tree-item-expanded .x-tree-elbow-expander:hover{
        background-position: -165px -65px;
    }
    .x-tree-show-line .icon-pkg{
        background-position:-234px -2px;
    }
    .x-tree-show-line .bui-tree-item-expanded .icon-pkg{
        background-position:-234px -23px;
    }
    .bui-tree-list .x-tree-icon{
        width: 21px;
    }


    .icon-example{
        margin-right: 0px;
        height: 17px;
        background-position: -235px -45px;
        vertical-align: middle;
    }

</style>