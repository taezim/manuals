package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.TeamWinning;


@Repository
public class TeamWinningRepositoryImpl implements TeamWinningRepository{

	private JdbcTemplate template;
	
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template=new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<TeamWinning> readAllWinningList() {
		String SQL = "SELECT * FROM t_score";
		List<TeamWinning> listOfWinnings = template.query(SQL, new TeamWinningRowMapper());
		return listOfWinnings;
	}

	@Override
	public TeamWinning readWinningById(String teamId) {
		TeamWinning winningInfo = null;
		
		String SQL = "SELECT COUNT(*) FROM t_score WHERE ts_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, teamId);
		
		if(rowCount !=0) {
			SQL="SELECT * FROM t_score WHERE ts_id=?";
			winningInfo = template.queryForObject(SQL, new Object[] {teamId}, new TeamWinningRowMapper());
		}
		if(winningInfo == null) {
			throw new IllegalArgumentException("일치하는 결과가 없습니다.");
		}
		return winningInfo;
	}

	 //최근10경기보여주기
	
	@Override
	public List<TeamWinning> getRecentMatchesResults(String teamId) {
		String SQL = "SELECT * FROM t_score WHERE teamId=? ORDER BY ts_date desc limit 10";
		List<TeamWinning> listOfRecent = template.query(SQL, new TeamWinningRowMapper(), teamId);
		return listOfRecent;
	}
	
	
	
	//create
	@Override 
	public void setNewWinning(TeamWinning teamWinning) {
		String SQL = "INSERT INTO t_score (ts_id, teamid, ts_matches, ts_result, ts_date)"+"VALUES(?, ?, ?, ?, ?)";
		template.update(SQL,teamWinning.getWinningId(),teamWinning.getTeamId(),teamWinning.getMatches(),teamWinning.getResult(),teamWinning.getDate());
	}

	@Override
	public void setUpdateWinning(TeamWinning teamWinning) {
		String SQL = "UPDATE t_score SET teamid=?, ts_matches=?, ts_result=?, ts_date=? WHERE ts_id=?";
		template.update(SQL,teamWinning.getTeamId(),teamWinning.getMatches(),teamWinning.getResult(),teamWinning.getDate(),teamWinning.getWinningId());
	}

	@Override
	public void setDeleteWinning(String winningId) {
		String SQL = "DELETE FROM t_score WHERE ts_id=?";
		this.template.update(SQL, winningId);
		
	}


	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public int totalWins(String teamId) {
		String SQL = "SELECT COUNT(*) AS totalWins FROM t_score WHERE teamId=? AND ts_result='Win'";
		
		return template.queryForObject(SQL, Integer.class, teamId);
	}

	@Override
	public int totalTie(String teamId) {
		String SQL = "SELECT COUNT(*) AS totalTie FROM t_score WHERE teamId=? AND ts_result='Tie'";
	
		return template.queryForObject(SQL, Integer.class, teamId);
	}

	@Override
	public int totalLose(String teamId) {
		String SQL = "SELECT COUNT(*) AS totalLose FROM t_score WHERE teamId=? AND ts_result='Lose'";
		
		return template.queryForObject(SQL, Integer.class, teamId);
	}
	
	//승률 보여주기 (나중에 순위 보여주려면 저기서 내림차순?으로 순위 매기기 그리고 where 조건하고 sql문 조금 바꿔야함 groupby teamId로 해야함

	@Override
	public double calculateWinningRate(String teamId) {
		String SQL = "SELECT COUNT(*) FROM t_score WHERE teamId=? AND ts_result='Win'";
		int totalWins = template.queryForObject(SQL, Integer.class, teamId);
		
		String totalGamesSQL = "SELECT COUNT(*) FROM t_score WHERE teamId=?";
		int totalGames = template.queryForObject(totalGamesSQL, Integer.class, teamId);
		
		if(totalGames>0) {
			double winningRate = ((double) totalWins / totalGames) * 100;
			return Math.round(winningRate * 1000.0) / 1000.0;
		}
		else {
			return 0.0;
		}
		
	}

	@Override
	public int totalGames(String teamId) {
		String SQL = "SELECT COUNT(*) FROM t_score WHERE teamId=?";
		return template.queryForObject(SQL, Integer.class, teamId);
	}

}