package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Member;

public class MemberRowMapper implements RowMapper<Member>{
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException{
		Member member = new Member();
		member.setMemberId(rs.getString(1));
		member.setName(rs.getString(2));
		member.setPassword(rs.getString(3));
		member.setBirth(rs.getString(4));
		member.setTeam(rs.getString(5));
		member.setInjury(rs.getString(6));
		member.setClassId(rs.getString(7));
		member.setTeacherId(rs.getString(8));
		member.setPersonalRecord(rs.getString(10));
		member.setSex(rs.getString(11));
		member.setFileName(rs.getString(12));
		
		return member;
	}

}
