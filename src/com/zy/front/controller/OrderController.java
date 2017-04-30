package com.zy.front.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zpassion.commons.CommonUtils;
import com.zy.entities.Book;
import com.zy.entities.Cartitem;
import com.zy.entities.Order;
import com.zy.entities.Orderitem;
import com.zy.entities.User;
import com.zy.service.CartItemService;
import com.zy.service.OrderItemService;
import com.zy.service.OrderService;
import com.zy.tools.security.Page;

/**
 * 订单相关
 */
@Controller
public class OrderController
{
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private OrderItemService orderItemService;
	
	 /**
     * 查询当前登陆用户的订单
     */
	@RequestMapping(value = "/order/myorder")
	public String myorder(HttpServletRequest request,
			@RequestParam(value = "pageNumber",required = false, defaultValue = "1") int pageNumber) 
	{
		User user = ((User) request.getSession().getAttribute("user"));
        //分页查询订单
		Page<Order> page = orderService.getOrdersByUserId(user.getUserid(), pageNumber, 10);
		request.setAttribute("page", page);
		request.setAttribute("totalPage", page.getTotalPages());
        return "order/list";
    }

    /**
     * 生成订单
     */
	@RequestMapping(value = "/order/createOrder")
	public String createOrder(HttpServletRequest request,
			@RequestParam(value = "cartItemIds") String cartItemIDs,
			@RequestParam(value = "address") String address) 
	{
		if (cartItemIDs != null && address != null)
		{
			String[] cartItemIds = cartItemIDs.split(",");
			User sessionUser = ((User) request.getSession()
					.getAttribute("user"));
			Order order=orderService.createOrder(address,sessionUser,cartItemIds);
			
			request.setAttribute("order", order);
		}
		return "order/ordersucc";
	}

	/**
     * 查看订单详情
     */
	@RequestMapping(value = "/order/findOrder")
	public String findOrder(HttpServletRequest request,
			@RequestParam(value = "oid") String orderId) 
	{
		Order order=orderService.findById(orderId);
		request.setAttribute("order", order);
        return "order/desc";
    }
	
	/**
     * 取消订单，订单状态由1变为5
     */
	@ResponseBody
	@RequestMapping(value = "/order/cancleOrder")
	public  Map<String, String> cancleOrder(@RequestParam(value = "oid") String orderId) 
	{
		Map<String, String> msg = new HashMap<>();
		Order order=orderService.findById(orderId);
		if (order.getStatus() != 1) {
			msg.put("status", "0");
			msg.put("msg", "订单状态错误");
        } else {
	          order.setStatus(5);
	          orderService.saveOrUpdate(order);
	          msg.put("status", "1");
			  msg.put("msg", "取消订单成功");
	      }
        return msg;
    }
	
	 /**
     * 确认收货，订单状态由3(已发货)变为4(交易成功)
     */
	public  Map<String, String> confirmOrder(@RequestParam(value = "oid") String orderId) 
	{
		Map<String, String> msg = new HashMap<>();
		Order order=orderService.findById(orderId);
		if (order.getStatus() != 3) {
			msg.put("status", "0");
			msg.put("msg", "订单状态错误");
        } else {
	          order.setStatus(4);
	          orderService.saveOrUpdate(order);
	          msg.put("status", "1");
			  msg.put("msg", "收货成功");
	      }
        return msg;
    }

}
