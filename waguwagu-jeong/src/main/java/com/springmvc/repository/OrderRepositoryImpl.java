package com.springmvc.repository;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Cart;
import com.springmvc.domain.Order;

@Repository
public class OrderRepositoryImpl implements OrderRepository 
{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private Map<Long, Order> listOfOrders; // 관리자한테 리턴할거야 구매자 ㄴㄴ
	private long nextOrderId;
	
	public OrderRepositoryImpl() 
	{
		listOfOrders = new HashMap<Long, Order>();
		nextOrderId = 1000;
	}

	@Override
	public Long saveOrder(Order order)
	{
		String SQL = "INSERT INTO orders(c_id, o_date, o_id) VALUES (?, ?, ?)";
        jdbcTemplate.update(SQL, order.getCart().getCartId(), order.getDate(), getNextOrderId());
		listOfOrders.put(order.getOrderId(), order);
		return order.getOrderId();
	}
	
	private synchronized long getNextOrderId() 
	{
		return nextOrderId++;
	}

	
}
