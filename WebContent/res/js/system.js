var system = {
    formatString: function (str) {
        for (var i = 0; i < arguments.length - 1; i++) {
            str = str.replace("{" + i + "}", arguments[i + 1]);
        }
        return str;
    },
    modalDialog: function () {
        var opts = $.extend({
            title: '&nbsp;',
            width: 640,
            height: 480,
            modal: false,
            onClose: function () {
                $(this).dialog('destroy');
            }
        }, options || {});

        if (opts.url) {
            options.content = $("<iframe>").attr("src", options.url).attr("allowTransparency", "true").attr("scrolling", "auto").attr("width", "100%").attr("height", "98%").attr("frameBorder", "0");
        }

        return $("<div/>").dialog(opts);
    },
    tabs: function (command, obj_settings) {
        var opts = {
            width: "100%",
            height: "100%"
        };
        $.extend(opts, obj_settings);
        if (command === "add") {
            $(this).css('display', 'inline-block');

            var li_active = $(this).find(".active");
            if (li_active.length > 0) {
                li_active.removeClass("active");
                $("#" + li_active.attr('id').substring(4)).removeClass("active");
            }
            //如果存在则直接激活tab页
            if ($("#" + opts.id)[0]) {
                $("#tab_" + opts.id).addClass('active');
                $("#" + opts.id).addClass('active');
                return;
            }
            var title = $("<li/>").attr("id", "tab_" + opts.id);
            var _a_ = $("<a/>").attr("href", "#" + opts.id).attr("data-toggle", "tab").text(opts.title);

            if (opts.closeable) {
                _a_.append("&nbsp;&nbsp;");
                var _closeable_ = $("<i/>").addClass('icon-remove').attr('tabClose', opts.id).css('cursor', 'pointer');
                _closeable_.bind('click', function () {
                    var close_id = $(this).attr("tabClose");
                    var li_active = $(this).parent().parent();


                    var li_toactive = li_active.next();
                    if (li_toactive.length > 0) {
                        li_toactive.addClass("active");
                        $("#" + li_toactive.attr('id').substring(4)).addClass("active")
                    }
                    else {
                        li_toactive = li_active.prev();
                        if (li_toactive.length > 0) {
                            li_toactive.addClass("active");
                            $("#" + li_toactive.attr('id').substring(4)).addClass("active")
                        }
                        else
                            li_active.parent().css('display', 'none');
                    }
                    li_active.remove();
                    $("#" + close_id).remove();
                    if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
                        try {
                            CollectGarbage();
                        } catch (e) {
                        }
                    }
                });
                _a_.append(_closeable_);
            }
            title.append(_a_);
            var content;
            //是否指定TAB内容
            if (opts.content) {
                content = '<div style="height:100%" class="tab-pane" id="' + opts.id + '">' + opts.content + '</div>';
            }
            else {//没有内容，使用IFRAME打开链接
                content = '<div style="height:100%" class="tab-pane" id="' + opts.id + '"><iframe src="' + opts.url + '" width="' + opts.width + '" height="' + opts.height + '"';
                content += '" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe></div>';
            }
            $(title).bind()
            $(this).append(title);
            $(".tab-content").append(content);
            //激活TAB
            $("#tab_" + opts.id).addClass('active');
            $("#" + opts.id).addClass("active");
        }
        else if (command === "exists") {
            if ($("#" + opts.id))
                return true;
            return false;
        }
        else if (command === "select") {
            $("#" + opts.id).addClass("active");
        }
        else if (command === "close") {
            //如果关闭的当前千激活的tab页，则激活他的后一个tab页
            var li_active = $("li.active");
            if (li_active.attr("id") === "tab_" + opts.id) {
                var li_toactive = li_active.next();
                if (li_toactive.length > 0)
                    li_toactive.addClass("active");
                else {
                    li_toactive = li_active.prev();
                    if (li_toactive.length > 0)
                        li_toactive.addClass("active");
                    else
                        $(this).css('display', 'none');
                }
                li_active.remove();
            }
            else {
                //关闭TAB
                $("#tab_" + opts.id).remove();
            }
            //关闭内容tab-content
            $("#" + opts.id).remove();
        }
    }
}