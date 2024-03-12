package com.springmvc.repository;


import com.springmvc.domain.Order;

public interface OrderRepository 
{

	Long saveOrder(Order order); // 아 여기서 DB에 넣던가 해야할까 싶네
}
