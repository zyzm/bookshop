<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>登录 - 网上图书商城</title>
    <link href="${ctx}/res/css/user/login2013.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="head">
    <a href="${ctx}/"><img src="${ctx}/res/images/logo.png"/></a>
    <ul class="clearfix">
        <li class="n1"><a href="javascript:void(0);">货到付款</a>
        </li>
        <li class="n2"><a href="javascript:void(0);">正品保障</a>
        </li>
        <li class="n3"><a href="javascript:void(0);">上门退款</a>
        </li>
    </ul>
</div>
<input id="contextpath" type="hidden" readonly="readonly" value="<c:url value='/'/>"/>
<form id="Form1" action="${ctx}/user/login'/>" method="post">
    <div class="wrap clearfix">
        <div class="pic">
            <a id="aBgPicUrlReferTo" target="_blank"
               style="display:block;outline:none;blr:expression(this.onFocus=this.blur());"
               href="http://book.dangdang.com/20131122_hmzt"><img
                    src="${ctx}/res/images/DLYtushu480380_hr_20140407.jpg"/>
            </a>
        </div>
        <div class="infro">
            <div id="sile_login" style="display:none">
                <p class="account">
                    您目前已登录账户:<span id="save_username" info=""></span>
                </p>
                <p class="asure">为保证安全，请确认密码</p>
            </div>
            <div id="nor_login" style="display:block">
                <p class="title">登录网上图书商城</p>
                <div class="username" id="username_div">
                    <span></span>
                    <input type="text" name="txtUsername"
                           id="txtUsername" value="" utype="" maxlength="40" autocomplete="off" title="请输入用户名"
                           errordata="0" tabindex="1"/>
                    <a id="selectusertype" class="replacetype01" style="display:none" href="javascript:showusertype();">更换类型</a>
                    <label id="userReplacer" class="pwdReplace" style="display: none;"
                           for="txtUsername">邮箱/昵称/手机号码</label>
                </div>
                <p class="tips" id="user_mindstyle">
                    <span id="liDivErrorMessage" style="display: none;">请输入邮箱地址/昵称/手机号码</span>
						<span id="selecttype" class="error" style="display:none"><b>请选择用户类型</b>
						<input id="selusertypemail" type="radio" value="" name="selusertype"/>
								<label class="error_nickname">昵称</label> 
								<input id="selusertypemobile" type="radio" value="" name="selusertype"/>
								<label class="error_mobilename">手机号码</label>
						</span>
                </p>
            </div>
            <div class="password" id="password_div">
                <span></span><input class="pass" disableautocomplete onfocus="this.type='password'" id="txtPassword"
                                    name="txtPassword" title="请输入密码" maxlength="20" autocomplete="off"
                                    errordata="0" tabindex="2"/><label id="pwdReplacer"
                                                                       class="pwdReplace" style="display: none;"
                                                                       for="txtPassword">密码</label>
            </div>
            <p class="tips" id="pass_mindstyle">
                <span id="login_password_error" style="display: none;">请填写长度为6-20个字符的密码</span>
					<span id="casplockopen" class="error" style="display: none;"><b>大写锁定被打开</b>大写锁定可能会造成密码输入错误，可通过按Caps
						Lock键盘将其关闭。</span>
            </p>

            <div class="code_wrap" id="inputcode" style="display:none;">
                <div class="code" id="vcode_model">
                    <span></span>
                    <input type="text" name="txtVerifyCode" id="txtVerifyCode" title="请输入验证码" maxlength="5"
                           errordata="0"
                           autocomplete="off" tabindex="3"/>
                    <label id="codeReplacer" class="pwdReplace" style="display:none;" for="txtVerifyCode">验证码</label>
                </div>
                <img title="看不清？点击换一张" id="imgVcode" src="${ctx}/img/authImg?rand='+Math.random()+'"
                     onclick="this.src='${ctx}/img/authImg?r='+Math.random()"
                      style="margin-left: 5px; cursor:pointer; height: 30px; width: 75px;"/>

            </div>
            <p class="tips_code" id="vcode_mindstyle" style="display:none;"><!--  -->
                <span id="login_vcode_error" style="display:none">请填写图片中的字符，不区分大小写</span>
            </p>

            <p class="auto_login">
                <a href="#" tabindex="7">忘记密码？</a><input
                    type="checkbox" id="autologin" name="autologin" class="auto_box"/><input
                    type="hidden" id="ispersist" name="ispersist" value="off"/><span>七天内自动登录</span><span
                    class="safe">请勿在公用电脑上勾选此选项</span>
            </p>
            <p class="btn">
                <a href="javascript:void(0);" tabindex="6">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
            </p>
            <p class="register" id="immedate_register" style="display:block">
                <a
                        href="${ctx}/regist"
                        class="register_btn">立即注册</a><span>还不是当当用户？</span>
            </p>
            <p class="register" id="change_other" style="display:none">
                <a id="other_login" class="other">使用其他账号登录</a><a
                    href="${ctx}/view/user/regist.jsp"
                    class="register_btn">立即注册</a><span>还不是当当用户？</span>
            </p>

            <div class="login_btn" id="submit_signin_div">
                <input type="hidden" id="post_type" name="post_type" value="normal">
                <input type="hidden" id="login_type" name="login_type" value="0">
                <input type="hidden" name="action" id="action" value="login">
                <input type="hidden" name="view" id="view" value="CYWaGr0EQG4=">
                <input type="hidden" id="A12B56CD78EF90G"
                       name="A12B56CD78EF90G" value="W2xnVD0ojYgPcWSafPFn/A==">
                <input type="hidden" id="wdvalidatetoken"
                       name="wdvalidatetoken"
                       value="2BadZEqGdFyNUNC3ApgD95SkvAllyQ6gqGVMF4TQ/VKkwy7VqkfPcg==">
                <input type="hidden" id="auth_human_id" name="auth_human_id"
                       value="lw7nwcCFeWt8hYrzfpMiIj4cCcFdgphgsAyWbdOtoyDJ7QPlUzxaw7jJdQ6mI4+WOic+I3+n+fYCIOTPDu7xLDXu8gQXBIZpAdNuUHGCFwVvjGxaegHTtuYEd1F5embu">
                <input type="hidden" name="returnurl" id="returnurl"
                       value="http://www.dangdang.com/?_ddclickunion=536-534-hao360ming|ad_type=0|sys_id=1&amp;_utm_ad_id=30269#dd_refer=http://hao.360.cn/">
                <input type="submit" id="btnSign" style=" display:none;">
            </div>
            <div class="partner clearfix" id="share_login"
                 style="display:block;margin-top:54px">
                <p>使用合作网站登录网上图书商城</p>
                <ul>
                    <li><a
                            href="https://login.dangdang.com/login_third_alipay/login_alipay.aspx?returnurl=http://www.dangdang.com/?_ddclickunion=536-534-hao360ming|ad_type=0|sys_id=1&_utm_ad_id=30269#dd_refer=http://hao.360.cn/"
                            title="支付宝">支付宝</a>
                    </li>
                    <li><a href="javascript:toQzoneLogin();" title="QQ">ＱＱ</a>
                    </li>
                    <li><a href="javascript:openWind();" title="新浪微博"
                           id="open_sina_sign">新浪微博</a>
                    </li>
                    <li><a href="javascript:openWind_netease()" title="网易">网易</a>
                    </li>
                    <li><a href="javascript:openWind_renren();" title="人人网">人人网</a>
                    </li>
                    <li class="mr0"><a href="javascript:openWind_baidu()"
                                       title="百度">百度</a>
                    </li>
                    <li><a href="javascript:openWind_msn()" title="MSN">ＭＳＮ</a>
                    </li>
                    <li><a href="javascript:openWind_fetion()" title="飞信">飞信</a>
                    </li>
                    <li><a
                            href="https://login.dangdang.com/login_third_jsmobile/login_jsmobile.aspx?returnurl=http://www.dangdang.com/?_ddclickunion=536-534-hao360ming|ad_type=0|sys_id=1&_utm_ad_id=30269#dd_refer=http://hao.360.cn/"
                            title="江苏移动">江苏移动</a>
                    </li>
                    <li><a href="javascript:openWind_douban()" title="豆瓣">豆瓣</a>
                    </li>
                    <li><a href="javascript:openWind_qh360()" title="360">３６０</a>
                    </li>
                    <li class="mr0"><a href="javascript:openWind_souhu()"
                                       title="搜狐">搜狐</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <style type="text/css">
        .public_footer_box {
            width: 100%;
            margin: 0 auto;
            font: 12px "\5b8b\4f53", Arial, Helvetica, sans-serif;
            clear: both;
        }

        .public_footer {
            margin: 0 auto;
            width: 950px;
            padding: 32px 5px 0;
            font: 12px;
            color: #666;
            overflow: hidden;
        }

        .public_footer a {
            color: #666 !important;
            text-decoration: none;
            font-size: 12px;
        }

        .public_footer a:hover {
            color: #f60 !important;
            text-decoration: underline;
        }

        .public_footer .sep {
            display: inline-block;
            padding: 0 18px;
        }

        .public_footer .footer_copyright {
            padding-left: 168px;
            margin: 0 auto;
            width: 792px;
        }

        .public_footer .footer_copyright span {
            float: left;
            display: inline
        }

        .public_footer .footer_copyright span {
            padding-top: 10px;
        }

        .public_footer .footer_copyright a {
            padding-right: 4px;
        }

        .public_footer .footer_icon {
            margin: 10px 0 0 335px;
            width: 300px;
            height: 57px;
        }

        .public_footer .validator, .public_footer .knet {
            float: left;
            display: inline;
            padding: 0 5px;
            width: 135px;
            height: 47px;
        }
    </style>

    <div class="public_footer_box">
        <div class="public_footer">
            <div class="footer_copyright">
                <span>Copyright (C) 当当网 2004-2012, All Rights Reserved</span><span
                    class="sep">|</span><span><a
                    href="http://www.miibeian.gov.cn/" target="_blank">京ICP证041189号</a>
					</span><span><a
                    href="http://static.dangdang.com//music/topic/847_10762.shtml"
                    target="_blank">音像制品经营许可证 京音网8号</a>
					</span>
                <div class="clear"></div>
            </div>
            <div class="footer_icon">
                <div class="validator">
                    <a
                            href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202001051000098"
                            target="_blank" class="footer_img"><img
                            src="${ctx}/res/images/validate.gif">
                    </a>
                </div>
                <div class="knet">
                    <a
                            href="https://ss.knet.cn/verifyseal.dll?sn=2010091900100002234&pa=2510871"
                            tabindex="-1" id="urlknet" target="_blank"> <img width="128"
                                                                             height="47" alt="可信网站" name="CNNIC_seal"
                                                                             border="true"
                                                                             src="${ctx}/res/images/knetSealLogo.png">
                    </a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">var ctx = "${ctx}";</script>
<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/res/js/common.js"></script>
<script type="text/javascript" src="${ctx}/res/js/user/sign_in2013.js"></script>
</body>
</html>