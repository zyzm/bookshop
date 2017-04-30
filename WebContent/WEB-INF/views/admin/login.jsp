<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>登陆页面</title>
<!-- 调用CSS，JS -->
<link href="${ctx}/res/admin/images/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
    margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	line-height: 1.5;
	font-weight: normal;
	color: #546D87;
  background: #BBD9F5 url(${ctx}/res/admin/images/login1_08.gif) repeat-x;
}
-->
</style>
<script type="text/javascript" src="${ctx}/res/admin/js/login.js"></script>
</head>
<body ondragstart="window.event.returnValue=false" oncontextmenu="window.event.returnValue=false" onselectstart="event.returnValue=false">
<table width="990" height="650" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td width="318" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="299" align="right"><img src="${ctx}/res/admin/images/login1_01.gif" width="318" height="299" /></td>
        </tr>
        <tr>
          <td height="351" align="right"><img src="${ctx}/res/admin/images/login1_04.gif" width="318" height="351" /></td>
        </tr>
      </table>
    </td>
    <td width="366" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="299" background="${ctx}/res/admin/images/login_6.gif">
            <img src="${ctx}/res/admin/images/login1_02.gif" width="366" height="299" />
          </td>
        </tr>
        <tr>
          <td height="96" valign="top" background="${ctx}/res/admin/images/login_9.gif">
          	<form action="${ctx}/admin/login/logon" method="post">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" height="25">&nbsp;</td>
                <td width="48%" valign="top">
                  <label>
                  <input tabindex="1" name="adminName" value="" type="text"  onfocus="formfocus()" class="txt" size="25" id="adminName" autocomplete="off"/>
                  </label>
                </td>
                <td width="27%" rowspan="2"><a href="javascript:submit()">
                  <img src="${ctx}/res/admin/images/login_2.gif" width="57" height="55" border="0" /></a>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                	<label>
                  <input name="adminPwd" tabindex="2" value="" onfocus="formfocus()" type="password" class="txt" size="25" id="adminPwd" autocomplete="off"/>
                </label>
                </td>
              </tr>
              <tr>
                <td height="36">&nbsp;</td>
                <td>
                <label id="errorlabel" style="color:yellow;font:14px;">${msg}</label>
                </td>
                <td>&nbsp;</td>
              </tr>
            </table>
            </form>
          </td>
        </tr>
        <tr>
          <td height="255" background="${ctx}/res/admin/images/login1_07.gif">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="129">&nbsp;</td>
              </tr>
              <tr>
                <td align="center">版权所有 &copy; <a href="http://www.passion.net">www.passion.net</a> </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="318" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="299" align="left" background="${ctx}/res/admin/images/login1_03.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="351" align="left" background="${ctx}/res/admin/images/login1_06.gif">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
