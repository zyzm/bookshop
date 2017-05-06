package com.zy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zpassion.exception.ServiceException;
import com.zy.dao.Impl.BookDaoImpl;
import com.zy.dao.Impl.CategoryDaoImpl;
import com.zy.entities.Category;

@Service("categoryService")
public class CategoryService
{
	@Autowired
	private CategoryDaoImpl categoryDao;
	@Autowired
	private BookDaoImpl bookdao;

	public List<Category> findAllCategory()
	{
		// TODO Auto-generated method stub
		List<Category> categories = categoryDao.find("from Category c where c.parentCategoryId is null");
		return categories;
	}

	public void deleteCategory(String cid)
	{
		// TODO Auto-generated method stub
		/**
		 * 查询该分类下是否有二级分类
		 */
		Number count = categoryDao.count(
				"select count(*) from Category c where c.parentCategoryId = ?",
				cid);
		if (count.longValue() != 0L)
			throw new ServiceException("该分类下还有二级分类，不能删除");
		else
		{
			/**
			 * 查询该分类下是否还有图书
			 */
			Number bookCount = bookdao.count(
					"select count(*) from Book b where b.cid = ?", cid);
			if (bookCount.longValue() == 0L)
			{
				Category c = categoryDao.get(
						"from Category c where c.categoryid=?", cid);
				categoryDao.delete(c);
			}
			else
				throw new ServiceException("该分类下还有图书存在，不能删除");
		}
	}

	public Category getByID(String hql, String categoryID)
	{
		// TODO Auto-generated method stub
		categoryDao.get(hql, categoryID);
		return categoryDao.get(hql, categoryID);
	}

	public void saveOrUpdate(Category category)
	{
		// TODO Auto-generated method stub
		categoryDao.saveOrUpdate(category);
	}

	public List<Category> findChildCategories(String pid)
	{
		// TODO Auto-generated method stub
		List<Category> categories = categoryDao.find("from Category c where c.parentCategoryId = ?",pid);
		return categories;
	}

}
