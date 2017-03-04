var user = {
    data: {
        loginname: '',
        loginpass: '',
        reloginpass: '',
        email: '',
        verifyCode: ''
    },
    init: {
        initdata: {
            vcode: null,
        },
        initEvent: function () {
            $(".labelError").css('display', 'none');
            _change(user.init.initdata.vcode);
            $("table input[type!='image']").focus(function () {
                $(this).parent().parent().find("label[class='labelError']").css('display', 'none');
            });
            $("#submit").hover(function () {
                $(this).attr('src', ctx + "/res/images/regist2.jpg");
            }, function () {
                $(this).attr('src', ctx + "/res/images/regist1.jpg");
            }).click(user.submit);
        }
    },
    validate: function () {
        var flag = true;
        user.data.loginname = $('#loginname').val();
        user.data.loginpass = $('#loginpass').val();
        user.data.reloginpass = $('#reloginpass').val();
        user.data.email = $('#email').val();
        user.data.verifyCode = $('#verifyCode').val();
        if ($.trim(user.data.loginname) == '') {
            $('#loginnameError').css('display', 'block');
            flag = false;
        }
        if (user.data.loginname.length < 6 || user.data.loginname.length > 20) {
            $('#loginnameError').text('登录名长度只能在4-20位字符之间').css('display', 'block');
            flag = false;
        }
        if ($.trim(user.data.loginpass) == '') {
            $('#loginpassError').text('请输入密码').css('display', 'block');
            flag = false;
        }
        if (user.data.loginpass.length < 6 || user.data.loginpass.length > 20) {
            $('#loginpassError').text('密码长度只能在6-20位字符之间').css('display', 'block');
            flag = false;
        }
        if ($.trim(user.data.reloginpass) == '') {
            $('#reloginpassError').text('请输入密码').css('display', 'block');
            flag = false;
        }
        else if (user.data.reloginpass.length < 6 || user.data.reloginpass.length > 20) {
            $('#reloginpassError').text('密码长度只能在6-20位字符之间').css('display', 'block');
            flag = false;
        }
        else if (user.data.reloginpass != user.data.loginpass) {
            $('#reloginpassError').text('2次密码输入不一致').css('display', 'block');
            flag = false;
        }
        var myreg = /^[a-zA-Z0-9]+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,3}$/;
        if ($.trim(user.data.email) == '') {
            $('#emailError').text('请输入email').css('display', 'block');
            flag = false;
        }
        else if (!myreg.test(user.data.email)) {
            $('#emailError').text('请输入合法的email').css('display', 'block');
            flag = false;
        }
        if ($.trim(user.data.verifyCode) == '') {
            $('#verifyCodeError').text('请输入验证码').css('display', 'block');
            flag = false;
        }
        else if (user.data.verifyCode.length != 4) {
            $('#verifyCodeError').text('验证码长度为4位').css('display', 'block');
            flag = false;
        }
        return flag;
        ;
    },
    submit: function () {
        if (user.validate()) {
            $.ajax({
                url: ctx + "/user/regist",
                data: user.data,
                type: 'POST',
                error: function () {
                    alert('服务器响应错误');
                },
                success: function (data) {
                    if (data['status'] == '0') {
                        user.changeVCode();
                        for (var key in data) {
                            if (key != 'status')
                                $("#" + key).text(data[key]).css('display', 'block');
                        }

                    }
                    else {
                        $("form")[0].reset();
                        window.location.href = ctx+"/login";
                    }
                }
            });
        }
    },
    changeVCode: function () {
        $("#vCode").click();
    }

};
//1.初始化2.调用submmit
$(function () {
    user.init.initEvent();
});