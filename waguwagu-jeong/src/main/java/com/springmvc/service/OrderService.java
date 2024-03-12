package com.springmvc.service;

import com.springmvc.domain.Order;

public interface OrderService 
{
//	void setCartToOrder(Cart cart);
	void confirmOrder(String productId, long quantity);
	Long saveOrder(Order order); // 아 여기서 DB에 넣던가 해야할까 싶네
	
}
