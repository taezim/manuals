package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Product;
import com.springmvc.domain.Stadium;
import com.springmvc.repository.ProductRepository;
import com.springmvc.repository.StadiumRepository;

@Service
public class StadiumServiceImpl implements StadiumService
{
	@Autowired
	private StadiumRepository stadiumRepository;

	@Override
	public List<Stadium> readAllStadiumList() 
	{
		return stadiumRepository.readAllStaidumList();
	}

	@Override
	public List<Stadium> readStadiumListByCity(String city) 
	{
		List<Stadium> productsByCategory = stadiumRepository.readStaidumListByCity(city);
		return  productsByCategory;
	}

	@Override
	public Stadium readStadiumById(String stdId) {
		Stadium productById = stadiumRepository.readStaidumById(stdId);
		return productById;
	}

	@Override
	public void setNewStadium(Stadium std) {
	
		stadiumRepository.setNewStaidum(std);
	}

	@Override
	public void setUpdateStadium(Stadium std) 
	{
		stadiumRepository.setUpdateStadium(std);
	}

	@Override
	public void setDeleteStadium(String stadiumId) 
	{
		stadiumRepository.setDeleteStadium(stadiumId);
		
	}


}
