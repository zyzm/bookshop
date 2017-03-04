package com.zy.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController
{

	@RequestMapping("/")
	public String index()
	{
		return "main";
	}

	@RequestMapping("/top")
	public String top()
	{
		return "top";
	}

	@RequestMapping("/left")
	public String left()
	{
//        CategoryService categoryService = new CategoryServiceImpl();
//    	List<Category> categoryList = categoryService.findAllCategory();
//    	setAttr("categoryList", categoryList);
//        render("left2.jsp");
		return "left";
	}

	@RequestMapping("/body")
	public String body()
	{
		return "body";
	}

	@RequestMapping("/login")
	public String login()
	{
		return "user/login";
	}

	@RequestMapping("/regist")
	public String regist()
	{
		return "user/regist";
	}

	@RequestMapping("/changePwd")
	public String changePwd()
	{
		return "user/pwd";
	}
}
