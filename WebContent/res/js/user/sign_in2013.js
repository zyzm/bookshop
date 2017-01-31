$(function () {
    $("#txtUsername").focus(focus_username);
    $("#txtUsername").blur(blur_username);
    $("#txtPassword").blur(blur_password);
    $("#txtPassword").focus(focus_pass);
    document.onkeydown = txtPassword_keyDown;
    $(".btn a").click(function () {
        sign_check_and_submit();
    });
});
var param = {};
function txtPassword_keyDown(event) {
    var ev = event || window.event || arguments.callee.caller.arguments[0];
    if (ev && ev.keyCode == 13) {
        sign_check_and_submit();
        return false;
    }
}
function sign_check_and_submit() {
    if (check()) {
        $.ajax({
            url: ctx + "/user/login",
            data: param,
            type: 'POST',
            error: function () {
                alert('服务器响应错误');
            },
            success: function (data) {
                echo_error_message(parseInt(data['status']));
            }
        });
    }
}
function check() {

    if (!navigator.cookieEnabled) {
        alert("请您打开浏览器的Cookie功能！");
        return false;
    }
    var username = jQuery.trim(jQuery("#txtUsername").val());
    param['loginname'] = username;
    if (username == '' || username.length < 4 || username.length > 20) {
        jQuery("#user_mindstyle").addClass("error_words");
        jQuery("#liDivErrorMessage").show();
        jQuery("#liDivErrorMessage").html("请输入正确的账号");
        jQuery("#username_div").addClass('error');
        jQuery("#txtUsername").attr("errordata", "1");
        jQuery("#userReplacer").css("display", "none");
        jQuery("#txtUsername").focus();
        return false;
    }
    jQuery("#liDivErrorMessage").hide();
    var loginpass = jQuery.trim(jQuery('#txtPassword').val());
    param['loginpass'] = loginpass;
    if (loginpass == '' || loginpass.length < 6 || loginpass.length > 20) {
        jQuery("#txtPassword").attr("errordata", "1");
        jQuery("#txtPassword").focus();
        echo_error_message(7);
        return false;
    }
    jQuery("#login_password_error").hide();
    var vcode = jQuery.trim(jQuery('#txtVerifyCode').val());
    param['vcode'] = vcode;
    if (vcode == '' || !/\w{4}/.test(vcode)) {
        jQuery('#txtVerifyCode').attr("errordata", "1");
        jQuery('#txtVerifyCode').focus();
        echo_error_message(3);
        return false;
    }
    jQuery('#login_vcode_error').hide();
    return true;
}

function show_vcode_div() {
    if (!jQuery("#inputcode").is(":visible")) {
        jQuery("#inputcode").css("display", "block");
        jQuery("#vcode_mindstyle").show();
        jQuery("#share_login").css('margin-top', '0px');
    }
}
function focus_pass() {
    if (jQuery("#txtPassword").attr("errordata") == "0") {
        jQuery('#password_div').removeClass('error').addClass("focus");
        jQuery('#pass_mindstyle').removeClass().addClass("tips");
        jQuery('#login_password_error').removeClass("error_words").css("display", "block");
        jQuery("#casplockopen").hide();
        jQuery('#login_password_error').html("请填写长度为6-20个字符的密码");
        jQuery("#pwdReplacer").css("display", "none");
        show_vcode_div();
    }
}

function blur_username() {
    jQuery('#username_div').removeClass().addClass("username");
    if (jQuery("#txtUsername").attr("errordata") != "2") {
        jQuery('#liDivErrorMessage').hide();
        if (jQuery.trim(jQuery("#txtUsername").val()) == "") {
            jQuery("#userReplacer").css("display", "block");
            ;
            jQuery("#txtUsername").attr("errordata", "0");
        }
    }

}
function blur_password() {
    jQuery('#login_password_error').hide();
    jQuery("#password_div").removeClass().addClass('password');
    if (jQuery("#txtPassword").val() == "") {
        jQuery("#pwdReplacer").css("display", "block");
    }
}
function focus_username() {
    if (jQuery("#txtUsername").attr("errordata") == "0") {
        jQuery("#username_div").removeClass('error').addClass("focus");
        jQuery('#user_mindstyle').removeClass('error_words').addClass("tips");
        jQuery('#liDivErrorMessage').css("display", "block");
        jQuery('#liDivErrorMessage').html("请输入邮箱地址/昵称/手机号码");
        jQuery("#userReplacer").css("display", "none");
    }
}
function echo_error_message(code) {
    switch (code) {
        case 1:
            jQuery("#submit_signin_div").removeClass("login_btn02");
            break;
        case 2:
            jQuery('#txtPassword').focus();
            jQuery("#password_div").removeClass('focus').addClass('error');
            jQuery('#pass_mindstyle').addClass("error_words");
            jQuery('#login_password_error').css("display", "block");
            jQuery('#login_password_error').html("用户名或密码输入错误，请重新填写");
            jQuery("#pwdReplacer").css("display", "none");
            jQuery('#txtPassword').attr("errordata", "1");
            jQuery('#txtPassword').val('');
            jQuery('#txtPassword').focus();
            jQuery("#selusertypemail").attr("checked", false);
            jQuery("#selusertypemobile").attr("checked", false);
            show_vcode();
            break;
        case 3:
            jQuery("#inputcode").show();
            jQuery("#vcode_mindstyle").show();
            jQuery("#share_login").css('margin-top', '0px');
            jQuery("#vcode_model").addClass('error');
            jQuery("#vcode_mindstyle").addClass("error_words");
            jQuery('#login_vcode_error').css("display", "block");
            jQuery("#codeReplacer").css("display", "none");
            jQuery('#login_vcode_error').html("验证码输入错误，请重新填写");
            jQuery('#txtVerifyCode').attr("errordata", "1");
            jQuery('#txtVerifyCode').val('');
            jQuery('#txtVerifyCode').focus();
            jQuery("#selusertypemail").attr("checked", false);
            jQuery("#selusertypemobile").attr("checked", false);
            show_vcode();
            break;
        case 4:
            jQuery("#vcode_model").removeClass('focus').addClass('error');
            jQuery("#vcode_mindstyle").addClass("error_words");
            jQuery('#login_vcode_error').css("display", "block");
            jQuery("#codeReplacer").css("display", "none");
            jQuery('#login_vcode_error').html("请输入验证码");
            jQuery('#txtVerifyCode').attr("errordata", "1");
            jQuery('#txtVerifyCode').val('');
            jQuery('#txtVerifyCode').focus();
            show_vcode();
            break;
        case 5:
            jQuery("#liDivErrorMessage").show();
            jQuery("#user_mindstyle").addClass("error_words");
            jQuery("#username_div").addClass('error');
            jQuery("#liDivErrorMessage").html("请输入用户名");
            break;
        case 6:
            jQuery("#vcode_model").addClass('error');
            jQuery("#vcode_mindstyle").addClass("error_words");
            jQuery('#login_vcode_error').css("display", "block");
            jQuery('#login_vcode_error').html("验证码已过期，请刷新");
            jQuery("#codeReplacer").css("display", "none");
            show_vcode();
            break;
        case 7:
            jQuery('#pass_mindstyle').addClass("error_words");
            jQuery('#login_password_error').css("display", "block");
            jQuery('#login_password_error').html("请输入登录密码");
            jQuery("#pwdReplacer").css("display", "none");
            break;
        case 8:
            jQuery("#liDivErrorMessage").removeClass("error").addClass("hint");
            jQuery("#liDivErrorMessage").html("请输入邮箱/昵称/手机号码");
            break;
        case 9:
            jQuery('#vcodeerrormassage').removeClass("error").addClass("hint");
            jQuery('#vcodeerrormassage').html("验证码输入错误，请重新填写");
            jQuery("#chk_vcodeok").hide();
            show_vcode();
        case 10:
            jQuery('#vcodeerrormassage').removeClass("error").addClass("hint");
            jQuery('#vcodeerrormassage').html("注册失败");
            jQuery("#chk_vcodeok").hide();
        case 11:
            jQuery("#vcode_model").addClass('error');
            jQuery("#vcode_mindstyle").addClass("error_words");
            jQuery('#login_vcode_error').css("display", "block");
            jQuery('#login_vcode_error').html("请输入验证码");
            jQuery("#codeReplacer").css("display", "none");
            break;
        case 12:
            jQuery("#login_password_error").removeClass("hint").addClass("error error_words");
            jQuery('#login_password_error').css("display", "block");
            jQuery('#login_password_error').html("用户email尚未激活，请激活邮箱后登录！");
            jQuery('#txtVerifyCode').val('');
            jQuery("#selusertypemail").attr("checked", false);
            jQuery("#selusertypemobile").attr("checked", false);
            if (jQuery("#winlogin_vcode").is(":visible"))show_vcode();
            jQuery("#submit_signin_div").removeClass("login_btn02");
            break;
        case 13:
            window.location.href = ctx + "/";
            break;
        case 14:
            jQuery("#inputcode").show();
            jQuery("#vcode_mindstyle").show();
            jQuery("#share_login").css('margin-top', '0px');
            jQuery("#vcode_model").addClass('error');
            jQuery("#vcode_mindstyle").addClass("error_words");
            jQuery('#login_vcode_error').css("display", "block");
            jQuery("#codeReplacer").css("display", "none");
            jQuery('#login_vcode_error').html("为了你的账户安全，请输入验证码");
            jQuery('#txtVerifyCode').attr("errordata", "1");
            jQuery('#txtVerifyCode').val('');
            jQuery('#txtVerifyCode').focus();
            jQuery("#selusertypemail").attr("checked", false);
            jQuery("#selusertypemobile").attr("checked", false);
            show_vcode('imgVcode');
            break;
        default:
            break;
    }
}

function show_vcode() {
    document.getElementById("txtVerifyCode").value = "";
    $("#imgVcode").click();
}

function openWind() {
    var sinaloginurl = "https://login.dangdang.com/login_third_sina/login_weibo.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 420) / 2;
    var left = (document.body.clientWidth - 520) / 2;
    window.open(sinaloginurl, 'sina_login', 'height=448, width=620, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function toQzoneLogin() {
    childWindow = window.open("https://login.dangdang.com/login_third_qqoauth/login_qq_oauth.aspx?returnurl=" + login_returnurl, "TencentLogin", "width=600,height=420,menubar=no,scrollbars=yes, resizable=yes,status=yes,titlebar=no,toolbar=no,location=yes");
}

function openWind_renren() {
    var sinaloginurl = "https://login.dangdang.com/login_third_renren/login_renren.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 420) / 2;
    var left = (document.body.clientWidth - 520) / 2;
    window.open(sinaloginurl, 'renren_login', 'height=448, width=620, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_netease() {
    var sinaloginurl = "https://login.dangdang.com/login_third_netease/login_netease.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 420) / 2;
    var left = (document.body.clientWidth - 520) / 2;
    window.open(sinaloginurl, 'netease_login', 'height=448, width=620, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_msn() {
    var sinaloginurl = "https://login.dangdang.com/login_third_msn/login_msn.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 420) / 2;
    var left = (document.body.clientWidth - 520) / 2;
    window.open(sinaloginurl, 'msn_login', 'height=448, width=620, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_shengda() {
    var sinaloginurl = "https://login.dangdang.com/login_third_shengda/login_shengda.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 420) / 2;
    var left = (document.body.clientWidth - 520) / 2;
    window.open(sinaloginurl, 'shengda_login', 'height=448, width=620, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_baidu() {
    var sinaloginurl = "https://login.dangdang.com/login_third_baidu/login_baidu.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 420) / 2;
    var left = (document.body.clientWidth - 520) / 2;
    window.open(sinaloginurl, 'baidu_login', 'height=448, width=620, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_mail139() {
    var sinaloginurl = "https://login.dangdang.com/login_third_mail139/login_mail139.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 520) / 2;
    var left = (document.body.clientWidth - 880) / 2;
    window.open(sinaloginurl, 'mail139_login', 'height=448, width=980, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_fetion() {
    var sinaloginurl = "https://login.dangdang.com/login_third_fetion/login_fetion.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 420) / 2;
    var left = (document.body.clientWidth - 520) / 2;
    window.open(sinaloginurl, 'fetion_login', 'height=448, width=620, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_jsmobile() {
    var sinaloginurl = "https://login.dangdang.com/login_third_jsmobile/login_jsmobile.aspx?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 580) / 2;
    var left = (document.body.clientWidth - 680) / 2;
    window.open(sinaloginurl, 'js_mobile', 'height=640, width=900, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_douban() {
    var sinaloginurl = "https://login.dangdang.com/login_third_douban/login_douban.php?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 580) / 2;
    var left = (document.body.clientWidth - 680) / 2;
    window.open(sinaloginurl, 'douban', 'height=448, width=442, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_qh360() {
    var sinaloginurl = "https://login.dangdang.com/login_third_360/login_360.php?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 580) / 2;
    var left = (document.body.clientWidth - 680) / 2;
    window.open(sinaloginurl, 'qh_360', 'height=640, width=900, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}

function openWind_souhu() {
    var shloginurl = "https://login.dangdang.com/login_third_sohu/login_sohu.php?returnurl=" + login_returnurl;
    var top = (document.body.clientHeight - 580) / 2;
    var left = (document.body.clientWidth - 680) / 2;
    window.open(shloginurl, 'souhu', 'height=640, width=900, toolbar =no, menubar=no, scrollbars=yes, resizable=no,top=' + top + ',left=' + left + ', location=yes, status=no');
}
