package com.zy.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.zy.dao.BaseDaoI;


public class BaseDaoImpl<T> implements BaseDaoI<T>{
	
	@Resource
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public void save(T o)
	{
		// TODO Auto-generated method stub
		this.getSession().save(o);
	}

	@Override
	public void Update(T o)
	{
		// TODO Auto-generated method stub
		this.getSession().update(o);
	}

	@Override
	public void saveOrUpdate(T o)
	{
		// TODO Auto-generated method stub
		this.getSession().saveOrUpdate(o);
	}

	@Override
	public void delete(T o)
	{
		// TODO Auto-generated method stub
		this.getSession().delete(o);
	}

	@Override
	public List<T> find(String hql, Object... param)
	{
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}
	
	@Override
	public List<T> page(String hql, int page, int rows, Object... param) {
		Query q = this.getSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	@Override
	public T get(String hql, Object... param)
	{
		// TODO Auto-generated method stub
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return (T) l.get(0);
		}
		return null;
	}

	public int count(String hql, Object... param) {
		Query q = this.getSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return ((Number)q.uniqueResult()).intValue();
	}
	
	@Override
	public Integer executeHql(String hql)
	{
		// TODO Auto-generated method stub
		Query q = this.getSession().createQuery(hql);
		return q.executeUpdate();
	}
	
}
