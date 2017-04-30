package com.zy.front.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.entities.Book;
import com.zy.entities.Cartitem;
import com.zy.entities.User;
import com.zy.service.BookService;
import com.zy.service.CartItemService;

@Controller
public class CartItemController
{

	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private BookService bookService;

	/**
	 * 商品加入购物车并重定向到购物车页面
	 */
	@RequestMapping(value = "/cart/buy")
	public String buy(HttpServletRequest request,
			@RequestParam(value = "cartitem.bid") String bid,
			@RequestParam(value = "cartitem.quantity") int quantity)
	{
		User sessionUser = ((User) request.getSession().getAttribute("user"));
		Cartitem cartitem1 = cartItemService.findByUidAndBid(
				sessionUser.getUserid(), bid);
		if (cartitem1 == null)
		{// 购物车中没有该商品，添加商品条目
			Book book = bookService.findById(bid);
			Cartitem cartItem = new Cartitem(UUID.randomUUID().toString(),
					book, sessionUser, quantity);
			cartItemService.saveOrUpdate(cartItem);
		}
		else
		{ // 已有该商品，更新商品数量
			// 原商品数量加上要购买得数量
			cartitem1.setQuantity(cartitem1.getQuantity() + quantity);
			cartItemService.saveOrUpdate(cartitem1);
		}
		// 重定向到我的购物车页面
		return "redirect:/cart/mycart";
	}

	/**
	 * 我的购物车，查询当前登陆用户购物车中的所有商品
	 */
	@RequestMapping(value = "/cart/mycart")
	public String mycart(HttpServletRequest request)
	{
		User sessionUser = ((User) request.getSession().getAttribute("user"));
		List<Cartitem> cartitemList = cartItemService
				.getAllCartItemsByUserID(sessionUser.getUserid());
		request.setAttribute("cartItemList", cartitemList);
		return "cart/list";
	}

	@ModelAttribute
	public void getCartItem(
			@RequestParam(value = "cartItemId", required = false) String cartItemId,
			Map<String, Object> map)
	{
		if (cartItemId != null)
		{
			Cartitem cartItem = cartItemService.getCartitemById(cartItemId);
			map.put("cartitem", cartItem);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/cart/updateQuantity")
	public Map<String, String> updateQuantity(Cartitem cartitem)
	{
		Map<String, String> msg = new HashMap<>();
		if (cartitem.getQuantity() == 0)
		{
			cartItemService.delete(cartitem);
		}
		else
		{ // 更新商品数量
			cartItemService.saveOrUpdate(cartitem);
		}
		msg.put("status", "success");
		return msg;
	}

	@ResponseBody
	@RequestMapping(value = "/cart/deleteCart")
	public Map<String, String> deleteCart(
			@RequestParam(value = "cartItemId") String[] cartItemIDs)
	{
		Map<String, String> msg = new HashMap<>();
		if (cartItemIDs != null && cartItemIDs.length > 0)
		{
			cartItemService.deleteCart(cartItemIDs);
		}
		msg.put("status", "1");
		return msg;
	}

	/**
	 * 结算
	 */
	@RequestMapping(value = "/cart/toBuy")
	public String toBuy(HttpServletRequest request,@RequestParam(value = "cartItemIds") String cartItemIDs)
	{
		User sessionUser = ((User) request.getSession().getAttribute("user"));
		if(cartItemIDs != null)
		{String[] ids = cartItemIDs.split(",");
		List<Cartitem> cartitemList = cartItemService
				.getToBuyCartItems(sessionUser.getUserid(),ids);
		request.setAttribute("cartItemList", cartitemList);
		request.setAttribute("cartItemIds", cartItemIDs);
		}
		return "cart/showitem";
	}

}
