package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Coach;
import com.springmvc.domain.Lesson;


public class CoachRowMapper implements RowMapper<Coach>
{

	@Override
	public Coach mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Coach c = new Coach();
		c.setCoachId(rs.getNString(1));
		c.setCoachName(rs.getNString(2));
		c.setCertificate(rs.getNString(3));
		c.setCareer(rs.getNString(4));
		c.setDescription(rs.getString(5));
		c.setClassId(rs.getNString(6));
		c.setFileName(rs.getNString(7));

		return c;
	}

}
