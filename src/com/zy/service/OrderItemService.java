package com.zy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.dao.Impl.OrderDaoImpl;
import com.zy.dao.Impl.OrderItemDaoImpl;
import com.zy.entities.Order;
import com.zy.entities.Orderitem;

@Service("orderItemService")
public class OrderItemService
{
	@Autowired
	private OrderItemDaoImpl orderItemDao;

	public void saveOrUpdate(Orderitem orderItem)
	{
		// TODO Auto-generated method stub
		orderItemDao.saveOrUpdate(orderItem);
	}


}
