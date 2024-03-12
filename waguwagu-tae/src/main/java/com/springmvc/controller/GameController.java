package com.springmvc.controller;


import java.io.File;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Game;
import com.springmvc.domain.Match;
import com.springmvc.domain.Member;
import com.springmvc.domain.TeamWinning;
import com.springmvc.repository.TeamWinningRepository;
import com.springmvc.service.GameService;
import com.springmvc.service.MatchService;


@Controller
@RequestMapping("/games")
public class GameController {

	@Autowired
	private TeamWinningRepository teamWinningRepository;
	
	@Autowired
	private GameService gameService;

	@Autowired
	private MatchService matchService;
	
	@GetMapping
	public String requestGameList(Model model)
	{
		List<Game> list = gameService.readAllGame();
		model.addAttribute("list",list);
		
		return "/Game/games";
	}
	
	@GetMapping("/all")
	public String requestAllGames(Model model)
	{
		List<Game> list = gameService.readAllGame();
		model.addAttribute("list",list);
		
		return "/Game/game";
	}
	
	@GetMapping("/game")
	public String requestGameById(@RequestParam("id") String gameId, Model model) {
//		Match matchById = matchService.readMatchById(gameId);
//		model.addAttribute("match",matchById);
		Match matchById = matchService.readMatchById(gameId);
		Game gameById = gameService.readGameById(gameId);
		model.addAttribute("game",gameById);
		model.addAttribute("match",matchById);
		List<TeamWinning> sortedWinningList = teamWinningRepository.calAndSortWinningRate();
	    model.addAttribute("winningList", sortedWinningList);
		
		return "/Game/game";
	}
	
	@GetMapping("/add")
	public String requestAddGameForm(@ModelAttribute("addGame")Game game, Model model,HttpSession session) 
	{
		// 세션에서 로그인한 사용자 정보 가져오기
	    //Member member = (Member) session.getAttribute("member");
	    
	    // 세션에서 memberId 가져오기
	    String memberId = (String) session.getAttribute("memberId");
	    System.out.println("memberId=" + memberId);

	    // 기존에 사용되던 Member 객체를 사용하지 않음

	    model.addAttribute("memberId", memberId);
	    // memberId 값 가져오기
	    //String memberId = member.getMemberId();
		//System.out.println("memberId="+memberId);
		//model.addAttribute("memberId",memberId);
		//game.setUserId(memberId);
		
		return "/Game/addGame";
	}
	
	
	@PostMapping("/add")
	public String submitAddNewGame(@ModelAttribute("addGame")Game game, Model model ,HttpServletRequest request,HttpSession session) {
		System.out.println("POSTMAPPING 도착");
		// 세션에서 로그인한 사용자 정보 가져오기
	    //Member member = (Member) session.getAttribute("member");
	    
	    // memberId 값 가져오기
	    //String memberId = member.getMemberId();
		//System.out.println("memberId="+memberId);
		//model.addAttribute("member",member);
		//game.setUserId(memberId);
		
		// 세션에서 memberId 가져오기
	    //String memberId = (String) session.getAttribute("memberId");
	    //System.out.println("memberId=" + memberId);

	    // 기존에 사용되던 Member 객체를 사용하지 않음

	    //model.addAttribute("memberId", memberId);
	    
		
		String gameId = generateGameId(10);
		System.out.println(gameId);
		game.setGameId(gameId);

		MultipartFile img = game.getGameImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				game.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("사진 등록 실패");
			}
		}
		gameService.setNewGame(game);
		return "redirect:/games";
	}
	
	private String generateGameId(int length) {
		
		if(length<=0) {
			throw new IllegalArgumentException("길이는 1이상이어야 합니다.");
		}
		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();
		
		for(int i=0; i<length; i++) {
			int randomNumber = random.nextInt(10);
			stringBuilder.append(randomNumber);
		}
		return "G_"+ stringBuilder.toString();
	}
	
	@GetMapping("/update")
	public String getUpdateGameForm(@ModelAttribute("UpdateGame") Game game, @RequestParam("id") String gameId, Model model) {
		System.out.println("game Id : " +gameId);
		Game gameById = gameService.readGameById(gameId);
		model.addAttribute("game",gameById);
		
		
		return "/Game/updateGame";
	}
	
	@PostMapping("/update")
	public String submitUpdateGameForm(@ModelAttribute("UpdateGame") Game game, HttpServletRequest request, Model model) {
		
		MultipartFile img = game.getGameImage();
		
		System.out.println("포스트맵핑");
		System.out.println("game Id : " +game.getTeamId1());
		System.out.println(game);
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				game.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("사진 등록 실패");
			}
		}
		
		gameService.setUpdateGame(game);
		return "redirect:/games";
		
	}
	
	@RequestMapping(value="/delete")
	public String getDeleteForm(Model model, @RequestParam("id")String gameId) {
		System.out.println("delete시작");
		System.out.println(gameId+"삭제됨!!!");
		gameService.setDeleteGame(gameId);
		return "redirect:/games";
	}
	
	

}
