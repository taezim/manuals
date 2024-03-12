package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Cart;
import com.springmvc.domain.Order;
import com.springmvc.domain.Product;
import com.springmvc.repository.OrderRepository;
import com.springmvc.repository.ProductRepository;

@Service
public class OrderServiceImpl implements OrderService
{
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderRepository orderRepository;


	@Override
	public void confirmOrder(String productId, long quantity) 
	{
		Product pdById = productRepository.readProductById(productId);
		if(pdById.getUnitsInStock()<quantity) 
		{
			throw new IllegalArgumentException(" 품절입니다. 사용가능한 재고 수 :" + pdById.getUnitsInStock());
		}
		
		pdById.setUnitsInStock(pdById.getUnitsInStock() - quantity);
		
				
	}

	@Override
	public Long saveOrder(Order order) 
	{
		System.out.println("서비스 - saveOrder 도착");
		System.out.println(order.getCart().getCartId());
		Long orderId = orderRepository.saveOrder(order);
		if(order.getCart()!=null) 
		{
			cartService.delete(order.getCart().getCartId());
			System.out.println("카트 널 아님 카트 아이디는:" + order.getCart().getCartId() );
		
		}else 
		{
			System.out.println("order.getCart():" + order.getCart() );
		}
		return orderId;
	}

}
