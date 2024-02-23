package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import com.springmvc.service.TeamService;



@Controller
@RequestMapping("/team")
public class TeamController {

	@Autowired
	private TeamService teamService;
	
	
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
		
		return "/Team/team";
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
		return "redirect:/teams";
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
		return "redirect:/teams";
		
	}
	
	@GetMapping(value="/delete")
	public String getDeleteTeamForm(Model model, @RequestParam("id") String teamId) {
		teamService.setDeleteTeam(teamId);
		return "redirect:/teams";
	}
}


