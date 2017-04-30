package com.zy.entities;

import java.util.Set;

public class Category implements Comparable<Category>
{
	private String categoryid;
	private String categoryName;
	/*由于系统中需要将查询出来的JavaBean对象转换成json字符串，使用json-lib，
	 * 父对象如果类型使用自定义的JavaBean，即DictItem类本身，转换成json字符串的时候就会报错，提
	 * 示转换出现循环xxx，因此转换一下思路，使用String简单类型来保存关联关系即可。*/
	private String parentCategoryId;
	private String description;
	private Set<Category> childCategory;
	private long orderBy;

	public String getCategoryid()
	{
		return categoryid;
	}

	public void setCategoryid(String categoryid)
	{
		this.categoryid = categoryid;
	}

	public String getCategoryName()
	{
		return categoryName;
	}

	public void setCategoryName(String categoryName)
	{
		this.categoryName = categoryName;
	}

	public String getParentCategoryId()
	{
		return parentCategoryId;
	}

	public void setParentCategoryId(String parentCategoryId)
	{
		this.parentCategoryId = parentCategoryId;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public Set<Category> getChildCategory()
	{
		return childCategory;
	}

	public void setChildCategory(Set<Category> childCategory)
	{
		this.childCategory = childCategory;
	}

	public long getOrderBy()
	{
		return orderBy;
	}

	public void setOrderBy(long orderBy)
	{
		this.orderBy = orderBy;
	}

	@Override
	public int compareTo(Category o)
	{
		// TODO Auto-generated method stub
		if (this.orderBy > o.orderBy)
			return -1;
		if (this.orderBy < o.orderBy)
			return 1;
		if (this.orderBy == o.orderBy)
			return 0;
		return 0;
	}

}
