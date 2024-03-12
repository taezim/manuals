package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Stadium;

public class StadiumRowMapper implements RowMapper<Stadium> 
{

	@Override
	public Stadium mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Stadium std = new Stadium();
		std.setStadiumId(rs.getString(1));
		std.setStdName(rs.getString(2));
		std.setCity(rs.getString(3));
		std.setBuildingArea(rs.getInt(4));
		std.setTotalArea(rs.getInt(5));
		std.setInfieldMaterial(rs.getString(6));
		std.setOutfieldMaterial(rs.getString(7));
		std.setCenterLength(rs.getInt(8));
		std.setBaseLength(rs.getInt(9));
		std.setSeatsNumber(rs.getInt(10));
		std.setCapacity(rs.getInt(11));
		std.setBuiltYear(rs.getString(12));
		std.setFileName(rs.getString(13));	
		
		return std;
	}
	
}
