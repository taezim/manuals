package com.springmvc.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.MemberVO;

@Repository
public class LoginRepositoryImpl implements LoginRepository 
{
    @Autowired
    private SqlSessionTemplate mybatis;

    public int Login(MemberVO vo) throws Exception 
    {
        return mybatis.selectOne("Member.Login", vo);
    }
}
