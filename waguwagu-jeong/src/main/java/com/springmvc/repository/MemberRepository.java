package com.springmvc.repository;

import java.util.List;


import com.springmvc.domain.Member;
import com.springmvc.domain.MemberVO;

public interface MemberRepository {
   List<Member> readAllMemberList();
   Member getMemberbyId(String memberId);
   void createNewMember(Member member);
   void setUpdateMember(Member member);
   void setDeleteMember(String memberId);
   
   void updatePosition(String memberId);
 
}
