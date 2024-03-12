package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Order;

public interface OHRepository 
{
	List<Order> readAllHistory();
	Order readHistoryById(String orderId);
}
