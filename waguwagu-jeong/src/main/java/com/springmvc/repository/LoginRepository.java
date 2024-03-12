package com.springmvc.repository;

import com.springmvc.domain.MemberVO;

public interface LoginRepository 
{
	int Login(MemberVO vo) throws Exception;
}
