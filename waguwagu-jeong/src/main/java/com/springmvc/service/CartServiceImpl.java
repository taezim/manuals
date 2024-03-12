package com.springmvc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Cart;
import com.springmvc.repository.CartRepository;

@Service
public class CartServiceImpl implements CartService
{

	@Autowired
	private CartRepository cartRepository;
	
	@Override
	public Cart create(Cart cart) {
		
		return cartRepository.create(cart);
	}

	/*Case1) cartId가 Session 일때*/
	@Override
	public Cart read(String sessionId) 
	{
		
		return cartRepository.read(sessionId);// 세션Id에 해당하는 카트 객체 리턴
	
	}
	
	@Override
	public void delete(String cartId) 
	{
		cartRepository.delete(cartId);
	}

	
	@Override
	public void update(String cartId, Cart cart) 
	{
		cartRepository.update(cartId, cart);
		
	}
	
	/*유효성 추가 예정*/
	@Override
	public Cart validateCart(String cartId) {
		Cart cart = cartRepository.read(cartId);
		System.out.println(cart);
//	if(cart == null || cart.getCartItems().size()==0) 
//		{ System.out.println("카트가 비었습니다 예외발생 CartException");} 
	//여기서는 cart가 널이 아닌것을 확인함
		return cart;
	}

}
