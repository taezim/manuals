package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Member;
import com.springmvc.service.MemberService;

@Repository
public class MemberRepositoryImpl implements MemberRepository{

   private JdbcTemplate template;
   private List<Member> listOfMembers = new ArrayList<Member>();
   
   
   @Autowired
   public void setJdbctemplate(DataSource dataSource) {
      this.template = new JdbcTemplate(dataSource);
   }
   
   //////////////////////////////////*READ*//////////////////////////////////////////////////
   
   /*ALL*/
   @Override 
   public List<Member> readAllMemberList() {
      String SQL = "SELECT * FROM member";
      List<Member> listOfMembers = template.query(SQL, new MemberRowMapper());
      
      return listOfMembers;
   }
   
   /*ONE*/
   @Override
   public Member getMemberbyId(String memberId) {
      Member memberInfo = null;

      //17장 데이터베이스와연동
      String SQL = "SELECT count(*) FROM member where m_id=?";
      int rowCount = template.queryForObject(SQL, Integer.class, memberId);
      if(rowCount != 0) {
         SQL = "SELECT * FROM member where m_id=?";
         memberInfo = template.queryForObject(SQL, new Object[] {memberId},new MemberRowMapper());
      }
      
      if(memberInfo == null) {
         throw new IllegalArgumentException("사용자 id가 " +memberId+"인 프로필을 찾을 수 없습니다.");
      }
      return memberInfo;
   }

   //////////////////////////////////*CREATE*//////////////////////////////////////////////////
   
   @Override
   public void createNewMember(Member member) {
      String SQL = "insert into member(m_id, m_name, m_password, m_birth, m_position, m_team, m_injury, m_address, m_classId, m_record, m_sex, m_filename)" + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

      template.update(SQL, member.getMemberId(), member.getName(), member.getPassword(), member.getBirth(),member.getPosition(),member.getTeam(),member.getInjury(), member.getAddress(), member.getClassId(), member.getPersonalRecord(), member.getSex(), member.getFileName());
      
   }

   @Override
   public void setUpdateMember(Member member) {
      if(member.getFileName() != null) {
         String SQL = "UPDATE member SET m_name=?, m_password=?, m_birth=?,m_position, m_team=?, m_injury=?, m_address=?, m_classId=?, m_record=?, m_sex=?, m_fileName=? where m_id=?";
         template.update(SQL, member.getName(), member.getPassword(), member.getBirth(),member.getTeam(),member.getInjury(), member.getAddress(), member.getClassId(), member.getPersonalRecord(), member.getSex(), member.getFileName(), member.getMemberId());
      }
      else if (member.getFileName() == null) {
         
    	  String SQL = "UPDATE member SET m_name=?, m_password=?, m_birth=?,m_position, m_team=?, m_injury=?, m_address=?, m_classId=?, m_record=?, m_sex=?, m_fileName=? where m_id=?";
          template.update(SQL, member.getName(), member.getPassword(), member.getBirth(),member.getTeam(),member.getInjury(), member.getAddress(), member.getClassId(), member.getPersonalRecord(), member.getSex(), member.getFileName(), member.getMemberId());
      
      }  
   }

   /*DELETE*/
   @Override
   public void setDeleteMember(String memberId) 
   {
      String SQL = "DELETE from member where m_id=?";
      this.template.update(SQL, memberId);
   }

	@Override
	public void updatePosition(String memberId) 
	{	
		String status = getMemberbyId(memberId).getPosition();
		System.out.println(status);
		if(status.equals("코치")) 
		{
			String SQL = "UPDATE member SET m_position=? where m_id=?";
			template.update(SQL,"선수",memberId);
		}
		else {
			String SQL = "UPDATE member SET m_position=? where m_id=?";
			template.update(SQL,"코치",memberId );
		}
	}

  

}