$(function () {
    /*
     * 1. 给注册按钮添加submit()事件，完成表单校验
     */
    $("#submit").click(function () {
        $("#msg").text("");
        var bool = true;
        var param = {};
        $(".input").each(function () {
            var inputName = $(this).attr("name");
            if (!invokeValidateFunction(inputName)) {
                bool = false;
            }
            else
                param[inputName] = $(this).val();
        });
        if (bool)
            submit(param);
    });

    /*
     * 3. 输入框推动焦点时进行校验
     */
    $(".input").blur(function () {
        var inputName = $(this).attr("name");
        invokeValidateFunction(inputName);
    });
});
var code;
/*
 * 输入input名称，调用对应的validate方法。
 * 例如input名称为：loginname，那么调用validateLoginname()方法。
 */
function invokeValidateFunction(inputName) {
    inputName = inputName.substring(0, 1).toUpperCase() + inputName.substring(1);
    var functionName = "validate" + inputName;
    return eval(functionName + "()");
}

/*
 * 校验密码
 */
function validateLoginpass() {
    var bool = true;
    $("#loginpassError").css("display", "none");
    var value = $("#loginpass").val();
    if (!value) {// 非空校验
        errorcode(0);
        bool = false;
    } else if (value.length < 6 || value.length > 20) {//长度校验
        errorcode(1);
        bool = false;
    }
    return bool;
}

// 校验新密码
function validateNewpass() {
    var bool = true;
    $("#newpassError").css("display", "none");
    var value = $("#newpass").val();
    if (!value) {// 非空校验
        errorcode(3);
        bool = false;
    } else if (value.length < 6 || value.length > 20) {//长度校验
        errorcode(4);
        bool = false;
    }
    return bool;
}

/*
 * 校验确认密码
 */
function validateRenewpass() {
    var bool = true;
    $("#renewpassError").css("display", "none");
    var value = $("#renewpass").val();
    if (!value) {// 非空校验
        errorcode(6);
        bool = false;
    } else if (value != $("#newpass").val()) {//两次输入是否一致
        errorcode(7);
        bool = false;
    }
    return bool;
}

/*
 * 校验验证码
 */
function validateVcode() {
    var bool = true;
    var value = $("#vcode").val();
    if (!value) {//非空校验
        errorcode(8);
        bool = false;
    } else if (value.length != 4) {//长度不为4就是错误的
        errorcode(9);
        bool = false;
    }
    return bool;
}

function submit(param) {
    $.ajax({
        cache: false,
        async: false,
        type: "POST",
        dataType: "json",
        data: param,
        url: ctx + "/user/changePwd",
        success: function (data) {
            errorcode(data['status']);
        }
    });
}

function errorcode(code) {
    switch (code) {
        case 0:
            $("#loginpassError").css("display", "block");
            $("#loginpassError").text("原密码不能为空！");
            break;
        case 1:
            $("#loginpassError").css("display", "block");
            $("#loginpassError").text("原密码长度必须在6 ~ 20之间！");
            break
        case 2:
            $("#loginpassError").css("display", "block");
            $("#loginpassError").text("原密码错误！");
            _change("#vCode");
            break;
        case 3:
            $("#newpassError").css("display", "block");
            $("#newpassError").text("新密码不能为空！");
            break;
        case 4:
            $("#newpassError").css("display", "block");
            $("#newpassError").text("新密码长度必须在6 ~ 20之间！");
            break;
        case 5:
            $("#newpassError").css("display", "block");
            $("#newpassError").text("新密码不能和原密码相同！");
            break;
        case 6:
            $("#renewpassError").css("display", "block");
            $("#renewpassError").text("确认密码不能为空！");
            break;
        case 7:
            $("#renewpassError").css("display", "");
            $("#renewpassError").text("两次密码输入不一致！");
            break;
        case 8:
            $("#verifyCodeError").css("display", "block");
            $("#verifyCodeError").text("验证码不能为空！");
            break;
        case 9:
            $("#verifyCodeError").css("display", "block");
            $("#verifyCodeError").text("验证码长度必须为4位！");
            break;
        case 10:
            $("#verifyCodeError").css("display", "block");
            $("#verifyCodeError").text("错误的验证码！");
            show_vcode();
            break;
        case 11:
            $("#newpassError").css("display", "block");
            $("#newpassError").text("验证码已过期！");
            show_vcode();
            break;
        case 12:
            alert("修改密码成功");
            show_vcode();
            $("form")[0].reset();
            break;
    }
}

function show_vcode() {
    document.getElementById("vcode").value = "";
    $("#vCode").click();
}