package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Coach;

public interface CoachService 
{
	List<Coach> readAllCoachList();
	Coach readCoachById(String coachId);
	void setNewCoach(Coach c);
	
	void setUpdateCoach(Coach c);
	void setDeleteCoach(String coachId);
}
