package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Productqna;

public class ProductQnARowMapper implements RowMapper<Productqna>{

	

	
	//Product
	
	public Productqna mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		Productqna productqna = new Productqna();
		productqna.setNumber(rs.getString(1));
		productqna.setContent(rs.getString(2));
		productqna.setEmail(rs.getString(3));
		productqna.setDate(rs.getString(4));
		productqna.setProductid(rs.getString(5));
		
		return productqna;
	}


}
