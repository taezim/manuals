package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Product;
import com.springmvc.domain.Stadium;

public interface StadiumService 
{
	List<Stadium> readAllStadiumList(); // 여기에다 arr 적는거랑 안적는거의 : 다형성 활용하기 위함
	List<Stadium> readStadiumListByCity(String city);

	Stadium readStadiumById(String stadiumId);
	
	//7.2?3? 추가
	void setNewStadium(Stadium std);
	
	void setUpdateStadium(Stadium std);
	void setDeleteStadium(String stadiumId);
}
