package com.zy.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.entities.Book;
import com.zy.entities.Cartitem;

@Service("cartItemService")
public class CartItemService
{
	@Autowired
	private CartItemDaoImpl cartItemDao;

	public Cartitem findByUidAndBid(String userid, String bid)
	{
		// TODO Auto-generated method stub
		Cartitem cartitem = cartItemDao.get(
				"from Cartitem i where i.user.userid =? and i.book.bid =?",
				userid, bid);
		return cartitem;
	}

	public void saveOrUpdate(Cartitem cartItem)
	{
		// TODO Auto-generated method stub
		cartItemDao.saveOrUpdate(cartItem);
	}

	public List<Cartitem> getAllCartItemsByUserID(String userid)
	{
		// TODO Auto-generated method stub
		List<Cartitem> cartitems = cartItemDao.find(
				"from Cartitem i where i.user.userid =?", userid);
		return cartitems;
	}

	public Cartitem getCartitemById(String cartItemId)
	{
		// TODO Auto-generated method stub
		Cartitem cartitem = cartItemDao.get(
				"from Cartitem i where i.cartItemId =? ", cartItemId);
		return cartitem;
	}

	public void delete(Cartitem cartitem)
	{
		// TODO Auto-generated method stub
		cartItemDao.delete(cartitem);
	}

	public void deleteCart(String[] cartItemIDs)
	{
		// TODO Auto-generated method stub
		// 拼接sql
		StringBuilder sb = new StringBuilder(
				"delete from Cartitem i where i.cartItemId in (");
		for (String cartItemID : cartItemIDs)
		{
			sb.append('\'').append(cartItemID).append("',");
		}
		sb.deleteCharAt(sb.length() - 1).append(')');
		cartItemDao.executeHql(sb.toString());
	}

	public List<Cartitem> getToBuyCartItems(String userID, String[] cartItemIDs)
	{
		//查询用户购物车中所有商品
        List<Cartitem> allCartItemList = getAllCartItemsByUserID(userID);
        List<Cartitem> toBuyCartItemList = new ArrayList<>();
        for (Iterator<Cartitem> iter = allCartItemList.iterator(); iter.hasNext(); ) {
            Cartitem cartitem = iter.next();
            String _id = cartitem.getCartItemId();
            for (String id : cartItemIDs) {
                if (id.equals(_id)) {
                    toBuyCartItemList.add(cartitem);//加入用户要结算得商品
                }
            }
        }
        return toBuyCartItemList;
	}

}
