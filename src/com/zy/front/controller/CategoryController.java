package com.zy.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.entities.Category;
import com.zy.service.CategoryService;

@Controller
public class CategoryController
{  
	@Autowired
	private CategoryService categoryService;

	@ResponseBody
	@RequestMapping(value = "/categories")
	public List<Category> index()
	{
		List<Category> categoryList = categoryService.findAllCategory();
		return categoryList;
	}
}
