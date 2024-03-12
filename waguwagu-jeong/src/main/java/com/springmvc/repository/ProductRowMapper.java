package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Product;



public class ProductRowMapper implements RowMapper<Product>
{

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Product pd = new Product();
		pd.setProductId(rs.getString(1));
		pd.setProductName(rs.getString(2));
		pd.setUnitPrice(rs.getInt(3));
		pd.setDescription(rs.getString(4));
		pd.setCategory(rs.getString(5));
		pd.setUnitsInStock(rs.getInt(6));
		pd.setCondition(rs.getString(7));
		pd.setAccumulatedOrders(rs.getInt(8));
		pd.setRating(rs.getInt(9));
		pd.setFileName(rs.getString(10));
		
		return pd;
	}

}
