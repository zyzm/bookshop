package com.zy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "img")
public class ImgController
{
	@RequestMapping("/authImg")
	public String login()
	{
		return "user/login";
	}

}
