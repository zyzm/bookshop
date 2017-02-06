package com.zy.entities;

import java.sql.Blob;
import java.util.Date;

public class User
{
	private String userid;
	private String loginName;
	private byte[] loginPass;
	private String email;
	private Integer status;
	private String activationCode;
	private byte[] salt;
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
	public String getLoginName()
	{
		return loginName;
	}
	public void setLoginName(String loginName)
	{
		this.loginName = loginName;
	}
	public byte[] getLoginPass()
	{
		return loginPass;
	}
	public void setLoginPass(byte[] loginPass)
	{
		this.loginPass = loginPass;
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
	public byte[] getSalt()
	{
		return salt;
	}
	public void setSalt(byte[] salt)
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
