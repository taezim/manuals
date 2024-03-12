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

	@Override
	public List<Team> findByLocation(String location) {
		// TODO Auto-generated method stub
		return teamRepository.findByLocation(location);
	}

	@Override
	public boolean joinTeam(String userId, String teamId) {
		// 이미 팀에 속한 멤버인지 확인
        boolean isMember = teamRepository.isMember(userId, teamId);

        // 팀에 속하지 않은 경우에만 가입 처리
        if (!isMember) {
            teamRepository.joinTeam(userId, teamId);
            return true;
        }
        return false;
		
	}
	
}
