package com.springmvc.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Member;
import com.springmvc.domain.Product;
import com.springmvc.repository.MemberRepository;


@Service
public class MemberServiceImpl implements MemberService{

   @Autowired
   private MemberRepository memberRepository;
   
   private List<Member> listOfMembers = new ArrayList<Member>();


   @Override
   public void createNewMember(Member member) {
      memberRepository.createNewMember(member);
      
   }

   @Override
   public List<Member> readAllMemberList() {
      // TODO Auto-generated method stub
      return memberRepository.readAllMemberList();
   }
   
   @Override
   public Member getMemberById(String memberId) {
      Member memberById = memberRepository.getMemberbyId(memberId);
      return memberById;
   }
   
   @Override
   public void setUpdateMemeber(Member member) {
      memberRepository.setUpdateMember(member);
      
   }

   @Override
   public void setDeleteMember(String memberId) {
      memberRepository.setDeleteMember(memberId);
   }

	@Override
	public void updatePosition(String memberId) 
	{
		memberRepository.updatePosition(memberId);
		
	}

   
}