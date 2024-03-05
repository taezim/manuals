package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.springmvc.domain.Team;
import com.springmvc.domain.TeamWinning;
import com.springmvc.repository.TeamWinningRepository;
import com.springmvc.service.TeamService;
import com.springmvc.service.TeamWinningService;



@Controller
@RequestMapping("/team")
public class TeamController {

	@Autowired
	private TeamService teamService;
	
	@Autowired
	private TeamWinningService teamWinningService;
	
	@Autowired
	private TeamWinningRepository teamWinningRepository;
	//read
	@GetMapping
	public String requestTeamList(Model model) {
		List<Team> list = teamService.readAllTeamList();
		model.addAttribute("teamList",list);
		return "/Team/teams";
	} //전체목록 보기
	
	@GetMapping("/all")
	public String requestAllTeams(@RequestParam("id")String teamId, Model model) {
		List<Team> list = teamService.readAllTeamList();
		model.addAttribute("teamList",list);
		
		return "/Team/teams";
	} 
	
	@GetMapping("/team")
	public String requestTemaById(@RequestParam("id") String teamId, Model model) {
		Team teamById = teamService.readTeamById(teamId);
		model.addAttribute("tb",teamById);
	    String recentMatchesResult = teamWinningService.getRecentMatchesResult(teamId);
	    int totalWins = teamWinningService.totalWins(teamId);
	    int totalTies = teamWinningService.totalTie(teamId);
	    int totalLosses = teamWinningService.totalLose(teamId);
	    double winningRate = teamWinningService.calculateWinningRate(teamId);
	    int totalGames = teamWinningService.totalGames(teamId);
	   
	    // Add these attributes to the model
	    model.addAttribute("recentMatchesResult", recentMatchesResult);
	    model.addAttribute("totalWins", totalWins);
	    model.addAttribute("totalTies",totalTies);
	    model.addAttribute("totalLosses", totalLosses);
	    model.addAttribute("winningRate", winningRate);
	    model.addAttribute("totalGames",totalGames);
	    
	    
		return "/Team/ttt";
	}
	
	
	//create
	@GetMapping("/add")
	public String requestAddTeamForm(@ModelAttribute("addTeam")Team team) {
		System.out.println("/add GetMapping");
		return "/Team/add";  //addTeam
	}
	
	@PostMapping("/add")
	public String submitAddNewTeam(@ModelAttribute("addTeam")Team team, HttpServletRequest request) {
		MultipartFile img = team.getTeamImage();
		String teamId = generateTeamId(10);
		team.setTeamId(teamId);
		System.out.println("등록된 팀 아이디 : "+ teamId);
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		File saveFile = new File(save,saveName);
		
		if(img !=null&& !img.isEmpty()) 
		{
			try 
			{
				img.transferTo(saveFile);
				team.setFileName(saveName);
			}  
			catch (Exception e) 
			{
				throw new RuntimeException("구단 이미지 업로드가 실패하였습니다.");
			}
			
		}
		System.out.println("PostMapping 도착");
		System.out.println("id : "+team.getTeamId());
		System.out.println("name : "+team.getTeamName());
		
		teamService.setNewTeam(team);
		return "redirect:/team";
	}
	
	private String generateTeamId(int length) {
		
		if(length<=0) {
			throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
		}
		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();
		
		for(int i=0; i<length; i++) {
			int randomNumber = random.nextInt(10);
			stringBuilder.append(randomNumber);
		}
		return "T_"+ stringBuilder.toString();
	}
	
	@GetMapping("/update")
	public String getUpdateTeamForm(@ModelAttribute("updateTeam") Team team, @RequestParam("id") String teamId, Model model) {
		Team teamById = teamService.readTeamById(teamId);
		model.addAttribute("team", teamById);
		System.out.println("GetMapping(update)도착");
		return "/Team/updateForm";
	}
	
	@PostMapping("/update")
	public String submitUpdateTeamForm(@ModelAttribute("updateTeam") Team team, HttpServletRequest request) {
		MultipartFile img = team.getTeamImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		File saveFile = new File(save,saveName);
		
		if(img != null && !img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				team.setFileName(saveName);
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("팀 이미지 업로드가 실패하였습니다.");
			}
			
		}
		teamService.setUpdateTeam(team);
		return "redirect:/team";
		
	}
	
	@GetMapping(value="/delete")
	public String getDeleteTeamForm(Model model, @RequestParam("id") String teamId) {
		teamService.setDeleteTeam(teamId);
		return "redirect:/team";
	}
}


