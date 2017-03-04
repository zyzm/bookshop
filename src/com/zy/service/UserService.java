package com.zy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zpassion.commons.CommonUtils;
import com.zpassion.security.Algorithm;
import com.zpassion.security.SecurityUtils;
import com.zy.dao.Impl.UserDaoImpl;
import com.zy.entities.User;

@Service("userService")
public class UserService
{
	@Autowired
	private UserDaoImpl userDao;

	public int regist(User u)
	{
		// TODO Auto-generated method stub "",
		User user = userDao.get("from User u where u.loginName=? or u.email=?",u.getLoginName(), u.getEmail());
		if (user != null)
		{
			String _loginname = user.getLoginName();
			String _email = user.getEmail();
			if (_loginname != null && _loginname.equals(u.getLoginName()))
			{
				if (_email != null && _email.equals(u.getEmail()))
				{
					return 3;
				}
				return 1;
			}
			else if (_email != null && _email.equals(u.getEmail()))
				return 2;
		}
		u.setUserid(CommonUtils.uuid());
		u.setActivationCode(SecurityUtils.messageDigest(u.getUserid(),
				Algorithm.SHA_256));
		userDao.saveOrUpdate(u);
		return 0;
	}

	public User findByLoginname(String loginName)
	{
		// TODO Auto-generated method stub
		User user = userDao.get("from User u where u.loginName=?",loginName);
		return user;
	}

	public User findById(String userID)
	{
		// TODO Auto-generated method stub
		User user = userDao.get("from User u where u.userid=?",userID);
		return user;
	}

	public void saveOrUpdate(User user)
	{
		// TODO Auto-generated method stub
		userDao.saveOrUpdate(user);
	}

	public User findByActivecode(String code)
	{
		// TODO Auto-generated method stub
		User user = userDao.get("from User u where u.activationCode=?",code);
		return user;
	}

}
