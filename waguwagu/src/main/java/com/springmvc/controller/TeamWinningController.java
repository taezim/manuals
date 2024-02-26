package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Team;
import com.springmvc.domain.TeamWinning;
import com.springmvc.service.TeamService;
import com.springmvc.service.TeamWinningService;

@Controller
@RequestMapping("team/result")
public class TeamWinningController {
	
	@Autowired
	private TeamWinningService teamWinningService;
	
	@GetMapping
	public String requestWinningList(Model model) {
		List<TeamWinning> list =teamWinningService.readAllWinningList();
		model.addAttribute("winningList",list);
		return "/Team/winnings";
	}
	
	@GetMapping("/all")
	public String requestAllWInningList(@RequestParam("id") String winningId, Model model) {
		List<TeamWinning> list = teamWinningService.readAllWinningList();
		return "/Team/winnings";
	}
	
//	@GetMapping("/winning")
//	public String requestWinningById(@RequestParam("id") String winningId, Model model) {
//		TeamWinning winningById = teamWinningService.readWinningById(winningId);
//		model.addAttribute("winning",winningById);
//		return"/Team/winning";
//	}
	
	@GetMapping("/winning")
	public String requestWinningDetails(@RequestParam("id") String teamId, Model model) {
	    // Get recent matches result, total wins, total losses, and winning rate from service
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

	    return "/Team/winning";
	}
	
	
	@GetMapping("/recent")
    public String getRecentMatchesResult(@RequestParam("id") String teamId, Model model) {
        String recentMatchesResult=teamWinningService.getRecentMatchesResult(teamId);
        model.addAttribute("recent",recentMatchesResult);
        
        System.out.println("recent도착");
        return "/Team/recent";
    }
	
	//create
	@GetMapping("/add")
	public String requestAddWinningForm(@ModelAttribute("addWinning")TeamWinning teamWinning) {
		return "/Team/radd";
	}
	
	@PostMapping("/add")
	public String submitAddNewWinning(@ModelAttribute("addWinning")TeamWinning teamWinning, HttpServletRequest request){
		teamWinningService.setNewWinning(teamWinning);
		return "redirect:/team/result";
	}
	
	@GetMapping("/update")
	public String getUpdateWinningForm(@ModelAttribute("updateWinning") TeamWinning teamWinning, @RequestParam("id") String winningId, Model model) {
		TeamWinning winningById = teamWinningService.readWinningById(winningId);
		System.out.println("위닝 아이디 : " +winningId);
		model.addAttribute("winning",winningById);
		return "/Team/rupdateForm";
	}
	
	@PostMapping("/update")
	public String submitUpdateWinningForm(@ModelAttribute("updateWinning") TeamWinning teamWinning ) {
		teamWinningService.setUpdateWinning(teamWinning);
		return "redirect:/winning";
	}
	
	@GetMapping(value="/delete")
	public String getDeleteForm(Model Model, String winningId) {
		teamWinningService.setDeleteWinning(winningId);
		return "redirect:/team/result";
	
	}
	
	@GetMapping("/rate")
	public String getTeamRate(@RequestParam("id") String teamId, Model model) {
		
		double winningRate = teamWinningService.calculateWinningRate(teamId);
	    model.addAttribute("winningRate", winningRate);
	    return "/Team/rate"; // 뷰 페이지의 경로에 맞게 수정
	
	}
}