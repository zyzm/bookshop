package com.zy.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zpassion.commons.CommonUtils;
import com.zy.dao.Impl.OrderDaoImpl;
import com.zy.dao.Impl.OrderItemDaoImpl;
import com.zy.entities.Book;
import com.zy.entities.Cartitem;
import com.zy.entities.Order;
import com.zy.entities.Orderitem;
import com.zy.entities.User;
import com.zy.tools.security.Page;

@Service("orderService")
public class OrderService
{
	@Autowired
	private OrderDaoImpl orderDao;

	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private OrderItemDaoImpl orderItemDao;

	public void saveOrUpdate(Order order)
	{
		// TODO Auto-generated method stub
		orderDao.saveOrUpdate(order);
	}

	public Order createOrder(String address, User sessionUser,
			String[] cartItemIds)
	{
		// 创建订单
		Order order = new Order();
		order.setOid(CommonUtils.uuid());
		order.setAddress(address);
		order.setOrdertime(Calendar.getInstance().getTime());
		order.setStatus(1);// 订单状态为未付款
		order.setUser(sessionUser);
		// 查询要购买得订单项
		List<Cartitem> toByCartItemList = cartItemService.getToBuyCartItems(
				sessionUser.getUserid(), cartItemIds);
		List<Orderitem> orderItemList = new ArrayList<Orderitem>();
		// 处理订单项
		BigDecimal totalPrice = new BigDecimal("0.0");
		for (Cartitem cartItem : toByCartItemList)
		{
			Orderitem orderitem = new Orderitem();
			orderitem.setBid(cartItem.getBook().getBid());
			orderitem.setBname(cartItem.getBook().getBname());
			orderitem.setCurrPrice(new BigDecimal(cartItem.getBook()
					.getCurrPrice() + ""));
			orderitem.setImageB(cartItem.getBook().getImageB());
			orderitem.setOrder(order);
			orderitem.setOrderItemId(CommonUtils.uuid());
			orderitem.setQuantity(cartItem.getQuantity());
			orderitem.setSubtotal(new BigDecimal(cartItem.getSubTotal() + ""));
			totalPrice = totalPrice.add(orderitem.getSubtotal());
			orderItemList.add(orderitem);
		}

		order.setTotal(totalPrice);// 订单总价
		orderDao.saveOrUpdate(order);// 保存订单
		// 保存订单项
		for (Orderitem orderitem : orderItemList)
		{
			orderItemDao.saveOrUpdate(orderitem);
		}
		// 删除已购买得购物车商品条目信息
		cartItemService.deleteCart(cartItemIds);
		return order;
	}

	public Page<Order> getOrdersByUserId(String userid, int pageNumber, int pageSize)
	{
		List<Order> orderList = orderDao.page("from Order o where o.user.userid =? order by o.ordertime desc",
				pageNumber, pageSize, userid);
		Page<Order> orderPage = new Page<Order>();
		orderPage.setList(orderList);
		orderPage.setPageNo(pageNumber);
		orderPage.setPageSize(pageSize);
		int totalRecords = orderDao.count(
				"select count(*) from Order o where o.user.userid =?", userid);
		orderPage.setTotalRecords(totalRecords);
		return orderPage;
	}

	public Order findById(String orderId)
	{
		// TODO Auto-generated method stub
		Order order=orderDao.get("from Order o where o.oid =?", orderId);
		return order;
	}
}
