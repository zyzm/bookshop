package com.zy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.service.UserService;

@Controller
@RequestMapping(value = "User")
public class UserController
{
//	@Autowired
//	private  UserService userService;
//	
	@RequestMapping("/login")
	public String login()
	{
		return "user/login";
	}

}
