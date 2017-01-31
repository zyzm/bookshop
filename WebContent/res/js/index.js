/**
 * Created by zhaop on 2016/3/29.
 */
var bar = new Q6MenuBar("bar", "网上图书商城");
$(function () {
    var index = {
        loadCategories: function () {
            $.ajax({
                url: ctx + "/categories",
                type: 'POST',
                dataType: 'json',
                timeout: 20000,
                success: function (data) {
                    if (data) {
                        bar.colorStyle = 4;//配置背景样式
                        bar.config.imgDir = ctx + "/res/thrid/menu/img/";//+ -图片路径
                        bar.config.radioButton = true;//展开是否互相排斥
                        for (var i = 0, len = data.length; i < len; i++) {
                            var levelOneItem = data[i],
                                childrens = levelOneItem.childrens;
                            if (!childrens) continue;
                            for (var j = 0, len2 = childrens.length; j < len2; j++) {
                                var item = childrens[j];
                                bar.add(levelOneItem.cname, item.cname, '{0}/book/getCategoryBooks?cid={1}'.format(ctx, item.cid), "body");
                            }
                        }
                        $("#menu").html(bar.toString());
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }

            })
        }
    };

    index.loadCategories();
});
