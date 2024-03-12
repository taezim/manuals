package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.MemberVO;
import com.springmvc.repository.LoginRepository;

@Service
public class LoginServiceImpl implements LoginService
{

    @Autowired
    private LoginRepository loginRepository;
	
	@Override
	public int Login(MemberVO vo) throws Exception {
		
		return loginRepository.Login(vo);
	}

}
