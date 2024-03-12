package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.CartItem;
import com.springmvc.repository.CartItemRepository;

@Service
public class CartItemServiceImpl implements CartItemService
{
	@Autowired
	private CartItemRepository cartItemRepository;
	
	
	
	@Autowired
	private ProductService productService;

    public CartItemServiceImpl(ProductService productService) 
    {
        this.productService = productService;
    }

    public CartItem createCartItem(String productId,String cartId) 
    {
        CartItem cartItem = new CartItem(productService, productId, cartId);
    
        return cartItem;
    }

	@Override
	public List<CartItem> readAllCartItem(String cartId) 
	{
		return cartItemRepository.readAllCartItem(cartId);
	}

	@Override
	public void removeCartItem(CartItem item) 
	{
		cartItemRepository.removeCartItem(item);
		
	}

	@Override
	public void removeAllCartItem(String cartId) 
	{
		cartItemRepository.removeAllCartItem(cartId);
	}

	@Override
	public void addCartItem(CartItem item) 
	{
		cartItemRepository.addCartItem(item);
		
	}
	
}
