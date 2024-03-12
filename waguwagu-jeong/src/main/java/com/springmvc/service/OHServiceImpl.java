package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Order;
import com.springmvc.repository.OHRepository;

@Service
public class OHServiceImpl implements OHService
{
	@Autowired
	OHRepository ohr;
	
	
	@Override
	public List<Order> readAllHistory() 
	{
		return ohr.readAllHistory();
	}

	@Override
	public Order readHistoryById(String orderId) {
		
		return ohr.readHistoryById(orderId);
	}

}
