package com.zy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zpassion.commons.CommonUtils;
import com.zpassion.security.Algorithm;
import com.zpassion.security.SecurityUtils;
import com.zy.dao.UserDao;
import com.zy.entities.User;

@Service("userService")
public class UserService
{
	@Autowired
	private UserDao userDao;

	public int regist(User u)
	{
		// TODO Auto-generated method stub  "", 
		  User user=userDao.findUser(u.getLoginName(),u.getEmail());
	        if(user != null)
	        {
	            String _loginname=user.getLoginName();
	            String _email=user.getEmail();
	            if(_loginname!=null&&_loginname.equals(u.getLoginName()))
	            {
	                if(_email!=null&&_email.equals(u.getEmail()))
	                {
	                    return 3;
	                }
	                return 1;
	            }
	            else if(_email!=null&&_email.equals(u.getEmail()))
	                return 2;
	        }
	        u.setUserid(CommonUtils.uuid());
	        u.setActivationCode(SecurityUtils.messageDigest(u.getUserid(), Algorithm.SHA_256));
	        userDao.saveOrUpdate(u);
		return 0;
	}

}
