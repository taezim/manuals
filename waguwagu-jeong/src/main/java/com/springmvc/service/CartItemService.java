package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.CartItem;

public interface CartItemService 
{
	CartItem createCartItem(String productId, String cartId);
	List<CartItem> readAllCartItem(String cartId);
	void removeCartItem(CartItem item);
	void removeAllCartItem(String cartId);
	void addCartItem(CartItem item);
}
