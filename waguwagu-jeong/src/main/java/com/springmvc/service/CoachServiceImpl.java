package com.springmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Coach;
import com.springmvc.repository.CoachRepository;


@Service
public class CoachServiceImpl implements CoachService
{

	   @Autowired
	   private CoachRepository cr;
	   
	   private List<Coach> listOfCoaches = new ArrayList<Coach>();
	
	@Override
	public List<Coach> readAllCoachList() {

		return cr.readAllCoachList();
	}

	@Override
	public Coach readCoachById(String coachId) {

		 Coach coachById = cr.readCoachById(coachId);
		return coachById;
	}
	
	@Override
	public void setNewCoach(Coach c) {
	
		cr.setNewCoach(c);
	}

	@Override
	public void setUpdateCoach(Coach c) 
	{
		cr.setUpdateCoach(c);
		
	}

	@Override
	public void setDeleteCoach(String coachId) {
		cr.setDeleteCoach(coachId);
		
	}

}
