package com.zy.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.zy.entities.User;

@Repository
public class UserDao extends BaseDao
{

	public User findUser(String loginName, String email)
	{
		// TODO Auto-generated method stub
//		select loginname,email from t_user where loginname=? or email=?
		String hql = "from User u where u.loginName=? or u.email=?";
		Query query = getSession().createQuery(hql).setString(0, loginName).setString(1, email);
		User user = (User) query.uniqueResult();
//		System.out.println(user.getLoginName());
		return user;
	}

	public void saveOrUpdate(User u)
	{
		// TODO Auto-generated method stub
		getSession().saveOrUpdate(u);
	}
	
	

}
