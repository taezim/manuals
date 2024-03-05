package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Team;
import com.springmvc.repository.TeamRepository;

@Service
public class TeamServiceImpl implements TeamService{
	
	@Autowired
	private TeamRepository teamRepository;

	
	@Override
	public List<Team> readAllTeamList() {
		// TODO Auto-generated method stub
		return teamRepository.readAllTeamList();
	}

	@Override
	public List<Team> readTeamListByCategory(String prefArea) {

		List<Team> teamsByArea = teamRepository.readTeamListByArea(prefArea);
		
		return teamsByArea;
	}

	@Override
	public Team readTeamById(String teamId) {
		Team teamById = teamRepository.readTeamById(teamId);
		
		return teamById;
	}

	@Override
	public void setNewTeam(Team team) {
		teamRepository.setNewTeam(team);
		
	}

	@Override
	public void setUpdateTeam(Team team) {
		teamRepository.setUpdateTeam(team);
		
	}

	@Override
	public void setDeleteTeam(String teamId) {
		teamRepository.setDeleteTeam(teamId);
		
	}
	
}
