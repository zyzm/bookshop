package com.zy.entities;

// Generated 2017-3-29 21:05:00 by Hibernate Tools 3.4.0.CR1

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * TOrder generated by hbm2java
 */
public class Order
{

	private String oid;
	private User user;
	private Date ordertime;
	private BigDecimal total;
	private Integer status;
	private String address;
	private Set<Orderitem> orderitems = new HashSet<Orderitem>(0);

	public Order()
	{
	}

	public Order(String oid)
	{
		this.oid = oid;
	}

	public Order(String oid, User user, Date ordertime, BigDecimal total,
			Integer status, String address, Set<Orderitem> orderitems)
	{
		super();
		this.oid = oid;
		this.user = user;
		this.ordertime = ordertime;
		this.total = total;
		this.status = status;
		this.address = address;
		this.orderitems = orderitems;
	}

	public String getOid()
	{
		return oid;
	}

	public void setOid(String oid)
	{
		this.oid = oid;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public Date getOrdertime()
	{
		return ordertime;
	}

	public void setOrdertime(Date ordertime)
	{
		this.ordertime = ordertime;
	}

	public BigDecimal getTotal()
	{
		return total;
	}

	public void setTotal(BigDecimal total)
	{
		this.total = total;
	}

	public Integer getStatus()
	{
		return status;
	}

	public void setStatus(Integer status)
	{
		this.status = status;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public Set<Orderitem> getOrderitems()
	{
		return orderitems;
	}

	public void setOrderitems(Set<Orderitem> orderitems)
	{
		this.orderitems = orderitems;
	}

}
