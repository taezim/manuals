package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Coach;

public interface CoachRepository 
{
	List<Coach> readAllCoachList();
	
	
	Coach readCoachById(String coachId);
	void setNewCoach(Coach c);
	
	void setUpdateCoach(Coach c);
	void setDeleteCoach(String coachId);
}
