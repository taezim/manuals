package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.CartItem;

public interface CartItemRepository 
{
	List<CartItem> readAllCartItem(String cartId);
	void removeCartItem(CartItem item);
	void removeAllCartItem(String cartId);
	void addCartItem(CartItem item);
	
}
