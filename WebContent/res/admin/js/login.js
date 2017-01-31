document.onkeydown=onkeydown;
function submit()
{
	var adminNmaeElem=document.getElementById("adminName");
	var adminPwdElem=document.getElementById("adminPwd");
	var errorlabel=document.getElementById("errorlabel");
	var adminName=adminNmaeElem.value;
	var adminPwd=adminPwdElem.value;
	if(!adminName||adminName=="")
	{
		errorlabel.innerText="用户名不能为空";
		adminNmaeElem.focus();
	}
	else if(adminName.length<4||adminName.length>16)
	{
		errorlabel.innerText="用户名长度长度为4到16位";
		adminNmaeElem.focus();
	}
	else if(!adminPwd||adminPwd=="")
	{
		errorlabel.innerText="密码不能为空";
		adminPwdElem.focus();
	}
	else if(adminPwd.length<4||adminPwd.length>16)
	{
			errorlabel.innerText="密码长度必须为4到16位";
			adminPwdElem.focus();
	}
	else
		document.getElementsByTagName("form")[0].submit();
}

function formfocus()
{
	document.getElementById("errorlabel").innerText="";
}

function onkeydown(event)
{
	 var ev = event || window.event || arguments.callee.caller.arguments[0];
    if(ev&&ev.keyCode == 13){
        submit();
    }
}