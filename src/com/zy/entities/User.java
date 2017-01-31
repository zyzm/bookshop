package com.zy.entities;

import java.sql.Blob;
import java.util.Date;

public class User
{
	private String userid;
	private String loginname;
	private Blob loginpass;
	private String email;
	private Integer status;
	private String activationCode;
	private Blob salt;
	private String mobile;
	private Date registDate;

	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

	public String getLoginname()
	{
		return loginname;
	}

	public void setLoginname(String loginname)
	{
		this.loginname = loginname;
	}

	public Blob getLoginpass()
	{
		return loginpass;
	}

	public void setLoginpass(Blob loginpass)
	{
		this.loginpass = loginpass;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public Integer getStatus()
	{
		return status;
	}

	public void setStatus(Integer status)
	{
		this.status = status;
	}

	public String getActivationCode()
	{
		return activationCode;
	}

	public void setActivationCode(String activationCode)
	{
		this.activationCode = activationCode;
	}

	public Blob getSalt()
	{
		return salt;
	}

	public void setSalt(Blob salt)
	{
		this.salt = salt;
	}

	public String getMobile()
	{
		return mobile;
	}

	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}

	public Date getRegistDate()
	{
		return registDate;
	}

	public void setRegistDate(Date registDate)
	{
		this.registDate = registDate;
	}

}
