package com.zy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.dao.Impl.CategoryDaoImpl;
import com.zy.entities.Category;

@Service("categoryService")
public class CategoryService
{
	@Autowired
	private CategoryDaoImpl categoryDao;

	public List<Category> findAllCategory()
	{
		// TODO Auto-generated method stub
		List<Category> categories = categoryDao.find("from Category c where c.parentCategoryId is null");
		return categories;
	}

}
