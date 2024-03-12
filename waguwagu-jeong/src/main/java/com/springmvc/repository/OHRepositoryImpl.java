package com.springmvc.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Order;
import com.springmvc.service.OHService;


@Repository
public class OHRepositoryImpl implements OHRepository
{

	@Autowired
	private OHService ohs;
	
	@Override
	public List<Order> readAllHistory() 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Order readHistoryById(String orderId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
