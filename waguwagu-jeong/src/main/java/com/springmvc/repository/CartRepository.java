package com.springmvc.repository;

import com.springmvc.domain.Cart;

public interface CartRepository 
{
	
	/**/
	Cart read(String cartId);
	
	void delete(String cartId);

	Cart create(Cart cart);

	void update(String cartId, Cart cart);
	
	void updateGrandTotal(String cartId); 

	
	
	
}
