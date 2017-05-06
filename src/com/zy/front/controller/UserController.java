package com.zy.front.controller;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.zy.entities.User;
import com.zy.service.UserService;
import com.zy.tools.security.Mail;
import com.zy.tools.security.ToolPbkdf2;

@SessionAttributes(value = { "user" })
@Controller
@RequestMapping(value = "user")
public class UserController
{
	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("/login")
	public Map<String, String> login(HttpServletRequest request,
			@RequestParam(value = "vcode") String verifycode,
			@RequestParam(value = "loginpass") String loginPass,
			@RequestParam(value = "loginname") String loginName,
			Map<String, Object> map)
	{
		Map<String, String> msg = new HashMap<>();
		// 获取验证码,
		String code = (String) request.getSession().getAttribute("code");
		// 校验验证码
		if (!code.equalsIgnoreCase(verifycode.toLowerCase()))
		{
			msg.put("status", "3");
		}
		else
		{
			// 用户名为空
			if (loginName == null)
				msg.put("status", "5");
			// 密码为空
			else if (loginPass == null)
				msg.put("status", "7");
			else
			{
				// 查询用户
				User user = userService.findByLoginname(loginName);
				if (user == null)
				{// 用户不存在
					msg.put("status", "2");
				}
				else
				{
					boolean result = false;
					try
					{
						// 校验密码
						result = ToolPbkdf2.authenticate(loginPass,
								user.getLoginPass(), user.getSalt());
					}
					catch (NoSuchAlgorithmException e)
					{
						e.printStackTrace();
					}
					catch (InvalidKeySpecException e)
					{
						e.printStackTrace();
					}
					if (result)
					{ // 密码校验成功
						user.setLoginPass(null);
						user.setSalt(null);
						map.put("user", user);
						msg.put("status", "13");
					}
					else
					{
						msg.put("status", "2");
					}
				}
			}
		}
		return msg;
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
		User user = new User();
		user.setLoginName(loginName);
		user.setRegistDate(new Date());
		user.setEmail(email);
		user.setStatus(0);
		byte[] salt = new byte[8];
		byte[] password = new byte[8];
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
		// 注册时idSHA_256加密生成激活码
		switch (userService.regist(user))
		// 保存用户
		{
		case 0:
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;
			if (Mail.sendMail(user.getEmail(), user.getActivationCode(),
					basePath))// 发送激活邮件
				msg.put("status", "1");// 发送成功
			else
			{
				msg.put("status", "0");// 发送激活邮件失败
				msg.put("emailError", "注册成功，但是激活邮件发送失败！");// 发送成功
			}
			break;
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

	// @SessionAttributes需要清除时，使用SessionStatus.setComplete();来清除。
	// 注意，它只清除@SessionAttributes的session，不会清除HttpSession的数据
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, SessionStatus sessionStatus)
	{
		request.getSession().removeAttribute("user");
		System.out.println("testRedirect");
		sessionStatus.setComplete();
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping("/changePwd")
	public Map<String, Integer> changePwd(HttpServletRequest request,
			@RequestParam(value = "vcode") String verifycode,
			@RequestParam(value = "loginpass") String oldPwd,
			@RequestParam(value = "newpass") String newPwd,
			@RequestParam(value = "renewpass") String renewpass)
	{
		// 获取验证码
		String code = (String) request.getSession().getAttribute("code");
		// 校验验证码
		Map<String, Integer> msg = new HashMap<>();
		if (!code.equalsIgnoreCase(verifycode.toLowerCase()))
		{
			msg.put("status", 10);
			return msg;
		}
		if (oldPwd == null || "".equals(oldPwd.trim()))
		{
			msg.put("status", 0);
			return msg;
		}
		if (oldPwd.length() < 6 || oldPwd.length() > 20)
		{
			msg.put("status", 1);
			return msg;
		}
		if (newPwd == null || "".equals(newPwd.trim()))
		{
			msg.put("status", 3);
			return msg;
		}
		if (newPwd.length() < 6 || newPwd.length() > 20)
		{
			msg.put("status", 4);
			return msg;
		}
		if (newPwd.equals(oldPwd))
		{
			msg.put("status", 5);
			return msg;
		}
		// 查询当前登陆用户原密码信息
		String accountID = ((User) request.getSession().getAttribute("user"))
				.getUserid();
		User user = userService.findById(accountID);
		try
		{
			// 校验密码是否正确
			boolean result = ToolPbkdf2.authenticate(oldPwd,
					user.getLoginPass(), user.getSalt());
			if (!result)// 不正确
			{
				msg.put("status", 2);
				return msg;
			}
			// 产生新得盐
			byte[] salt = ToolPbkdf2.generateSalt();
			byte[] newPassword = ToolPbkdf2.getEncryptedPassword(newPwd, salt);
			user.setLoginPass(newPassword);// 设置新密码
			user.setSalt(salt);// 加密盐
			userService.saveOrUpdate(user);// 更新
			msg.put("status", 12);
			return msg;
		}
		catch (Exception e)
		{
			msg.put("status", 14);
			return msg;
		}
	}

	// 用户激活账号
	@RequestMapping(value = "/active", params = { "activationCode" })
	public ModelAndView active(@RequestParam(value = "activationCode") String code,
			HttpServletRequest request,Map<String, String> map)
	{
		String viewName = "msg";
		ModelAndView modelAndView = new ModelAndView(viewName);
		// 获得激活码
		if (code!=null&&code.length() == 64)
		{
			User user = userService.findByActivecode(code);
			// 更新该激活码所对应用户得状态为1
			if (user!=null)
			{
				user.setStatus(1);
				userService.saveOrUpdate(user);
				User u = (User) request.getSession().getAttribute("user");
				if (u != null)
					u.setStatus(1);
				modelAndView.addObject("status", "1");
				modelAndView.addObject("msg", "激活成功");
			}
			else
			{
				modelAndView.addObject("status", "0");
				modelAndView.addObject("msg", "激活链接错误");
			}
		}
		else
		{
			modelAndView.addObject("status", "0");
			modelAndView.addObject("msg", "激活链接错误");
		}
		return modelAndView;
	}
}
