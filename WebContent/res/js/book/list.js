$(function () {
    $(".inner").hover(function () {
        $(this).css("border", "3px solid #FFCFB1");
    }, function () {
        $(this).css("border", "3px solid #ffffff");
    });
    var pager = $('#pager');
    laypage({
        cont: pager,
        pages: parseInt(pager.prev().val()), //可以叫服务端把总页数放在某一个隐藏域，再获取。假设我们获取到的是18
        skip: true, //是否开启跳页
        skin: 'molv',
        groups: 3, //连续显示分页数
        curr: function () { //通过url获取当前页，也可以同上（pages）方式获取
            var page = location.search.match(/pageNumber=(\d+)/);
            return page ? page[1] : 1;
        }(),
        jump: function (e, first) { //触发分页后的回调
            if (!first) { //一定要加此判断，否则初始时会无限刷新
                var n = window.location.href.indexOf("&"),
                    url;
                if(n != -1){
                    url = location.href.substring(0, n);
                } else {  
                    url = location.href;
                }
                location.href = url + '&pageNumber=' + e.curr;
            }
        }
    });
});