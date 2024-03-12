package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Coach;

@Repository
public class CoachRepositoryImpl implements CoachRepository
{
	 private JdbcTemplate template;
	 private List<Coach> listOfCoaches = new ArrayList<Coach>();
	   
	   
	   @Autowired
	   public void setJdbctemplate(DataSource dataSource) 
	   {
	      this.template = new JdbcTemplate(dataSource);
	   }

	@Override
	public List<Coach> readAllCoachList() 
	{
		 String SQL = "SELECT * FROM coach";
	     List<Coach> listOfCoaches = template.query(SQL, new CoachRowMapper());
	      
	      return listOfCoaches;
	}


	@Override
	public Coach readCoachById(String coachId) 
	{
		 Coach coachInfo = null;

	      //17장 데이터베이스와연동
	      String SQL = "SELECT count(*) FROM coach where c_id=?";
	      int rowCount = template.queryForObject(SQL, Integer.class, coachId);
	      if(rowCount != 0) {
	         SQL = "SELECT * FROM coach where c_id=?";
	         coachInfo = template.queryForObject(SQL, new Object[] {coachId}, new CoachRowMapper());
	      }
	      
	      if(coachInfo == null) {
	         throw new IllegalArgumentException("사용자 id가 " +coachId+"인 프로필을 찾을 수 없습니다.");
	      }
	      return coachInfo;
	}

	@Override
	public void setNewCoach(Coach c) 
	{
		String SQL = "insert into coach(c_id, c_name, c_certificate, c_description, c_career, c_classId,c_fileName)" + "values(?, ?, ?, ?, ?, ?, ?)";
		template.update(SQL, c.getCoachId(), c.getCoachName(), c.getCertificate(), c.getDescription(), c.getCareer(), c.getClassId(), c.getFileName());
	}

	@Override
	public void setUpdateCoach(Coach c) 
	{
	 if(c.getFileName() != null) {
         String SQL = "UPDATE coach SET c_name=?, c_certificate=?, c_description, c_career, c_classId=?, c_fileName=? where c_id=?";
         template.update(SQL, c.getCoachName(), c.getCertificate(), c.getDescription(), c.getCareer(), c.getClassId(), c.getFileName(), c.getCoachId());
      }
      else if (c.getFileName() == null) {
         
    	  String SQL = "UPDATE coach SET c_name=?, c_certificate=?, c_description, c_career, c_classId=?, c_fileName=? where c_id=?";
          template.update(SQL, c.getCoachName(), c.getCertificate(),c.getDescription(), c.getCareer(), c.getClassId(), c.getFileName(), c.getCoachId());
      }  
	}

	@Override
	public void setDeleteCoach(String coachId) 
	{
		String SQL = "DELETE from coach where c_id=?";
		this.template.update(SQL, coachId);
	}

}
