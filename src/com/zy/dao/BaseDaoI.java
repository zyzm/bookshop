package com.zy.dao;

import java.util.List;

/**
 * 基础数据库操作类
 * 
 * @author
 * 
 */
public interface BaseDaoI<T>
{
	/**
	 * 保存对象
	 * 
	 * @param o
	 *            对象
	 */
	public void save(T o);

	/**
	 * 更新对象
	 * 
	 * @param o
	 *            对象
	 */
	public void Update(T o);

	/**
	 * 保存或更新对象
	 * 
	 * @param o
	 *            对象
	 */
	public void saveOrUpdate(T o);

	/**
	 * 删除一个对象
	 * 
	 * @param o
	 *            对象
	 */
	public void delete(T o);

	/**
	 * 查找对象集合
	 * 
	 * @param hql
	 * @param param
	 * @return List<T>
	 */
	public List<T> find(String hql, Object... param);

	/**
	 * 查找对象集合,带分页
	 * 
	 * @param hql
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示记录数
	 * @param param
	 * @return 分页后的List<T>
	 */
	public List<T> page(String hql, int page, int rows, Object... param);

	/**
	 * 获得一个对象
	 * 
	 * @param hql
	 * @param param
	 * @return Object
	 */
	public T get(String hql, Object... param);
	
	/**
	 * select count(*) from 类
	 * 
	 * @param hql
	 * @param param
	 * @return Long
	 */
	public int count(String hql, Object... param);

	/**
	 * 执行HQL语句
	 * 
	 * @param hql
	 * @return 相应数目
	 */
	public Integer executeHql(String hql);

}
