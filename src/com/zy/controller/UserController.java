package com.zy.controller;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.entities.User;
import com.zy.service.UserService;
import com.zy.tools.security.ToolPbkdf2;

@Controller
@RequestMapping(value = "user")
public class UserController
{
    @Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login()
	{
		return "user/login";
	}

	/**
	 * 用户注册
	 */
	@ResponseBody
	@RequestMapping("/regist")
	public Map<String, String> regist(HttpServletRequest request,
			@RequestParam(value = "verifyCode") String verifycode,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "loginpass") String loginPass,
			@RequestParam(value = "loginname") String loginName)
	{
		Map<String, String> msg = new HashMap<>();
		// 校验验证码
		// 获取验证码
		String code = (String) request.getSession().getAttribute("code");
		if (!code.equalsIgnoreCase(verifycode.toLowerCase()))
		{
			msg.put("status", "0");
			msg.put("verifyCodeError", "验证码错误");
			return msg;
		}
		// String loginName = getPara("loginname");
		// String loginPass = getPara("loginpass");
		// String reloginpass = getPara("reloginpass");
		// String email = getPara("email");
		//页面已经验证过了，感觉不用再验证一遍
		// if (StrKit.isBlank(email))
		// msg.put("emailError", "email不能为空");
		// else if (!email
		// .matches("^[a-zA-Z0-9]+@([a-zA-Z0-9]+\\.)+[a-zA-Z0-9]{2,3}$"))
		// msg.put("emailError", "email格式错误");
		// if (!isValidate(loginName))
		// msg.put("loginnameError", "用户名不能为空");
		// if (!isValidate(loginName, 4, 20))
		// msg.put("loginnameError", "用户名必须在4-20位之间");
		// if (!isValidate(loginPass))
		// msg.put("loginpassError", "密码不能为空");
		// if (!isValidate(loginPass, 6, 20))
		// msg.put("loginpassError", "密码必须在6-20位之间");
		// if (!isValidate(reloginpass))
		// msg.put("reloginpassError", "确认密码不能为空");
		// if (!loginPass.equals(reloginpass))
		// msg.put("reloginpassError", "2次密码输入不一致");
		// if (msg.size() > 0)
		// {
		// msg.put("status", "0");
		// renderJson(msg);
		// return;
		// }
		 User user = new User();
		 user.setLoginName(loginName);
		 user.setRegistDate(new Date());
		 user.setEmail(email);
		 user.setStatus(0);
		 byte[] salt = new byte[0];
		 byte[] password = new byte[0];
		 try
		 {
		 salt = ToolPbkdf2.generateSalt();
		 password = ToolPbkdf2.getEncryptedPassword(loginPass, salt);
		 }
		 catch (NoSuchAlgorithmException e)
		 {
		 e.printStackTrace();
		 }
		 catch (InvalidKeySpecException e)
		 {
		 e.printStackTrace();
		 }
		 user.setLoginPass(password);
		 user.setSalt(salt);
		 switch (userService.regist(user))
		 // 保存用户
		 {
//		 case 0:
//		 if (sendMail(user, getRequest()))// 发送激活邮件
//		 msg.put("status", "1");// 发送成功
//		 else
//		 {
//		 msg.put("status", "0");// 发送激活邮件失败乃
//		 msg.put("emailError", "注册成功，但是激活邮件发送失败！");// 发送成功
//		 }
//		 break;
		 case 1:
		 msg.put("status", "0");
		 msg.put("loginnameError", "用户名已被注册！");
		 break;
		 case 2:
		 msg.put("status", "0");
		 msg.put("emailError", "email重复");
		 break;
		 case 3:
		 msg.put("status", "0");
		 msg.put("loginnameError", "用户名已存在！");
		 msg.put("emailError", "email已经被注册！");
		 }
		// renderJson(msg);
		return msg;
	}

}
