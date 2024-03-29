package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Hospitalqna;

public class HospitalQnARowMapper implements RowMapper<Hospitalqna>{

	
	//Hospital

	@Override
	public Hospitalqna mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Hospitalqna hospitalqna = new Hospitalqna();
		hospitalqna.setNumber(rs.getString(1));
		hospitalqna.setContent(rs.getString(2));
		hospitalqna.setEmail(rs.getString(3));
		hospitalqna.setDate(rs.getString(4));
		hospitalqna.setHospitalid(rs.getString(5));
		
		return hospitalqna;
	}
	
	
}
