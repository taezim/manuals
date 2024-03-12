package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Order;


public interface OHService 
{
	List<Order> readAllHistory();
	Order readHistoryById(String orderId);
}
