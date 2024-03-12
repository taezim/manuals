package com.springmvc.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Coach;
import com.springmvc.domain.Member;
import com.springmvc.service.CoachService;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/manager")
public class ManagerController 
{
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CoachService coachService;
	
 	@GetMapping
   public String requestMemberList(Model model) 
	{
      List<Member> list = memberService.readAllMemberList();
      model.addAttribute("memberList",list);
      return "/manager/memberList";
   }
	
	@GetMapping("/all")
    public String requestAllMembers(Model model) 
    {
       List<Member> list = memberService.readAllMemberList(); // 호출하니까 이동
       
       model.addAttribute("memberList", list); // memberList.jsp 에서 list. 해서 꺼내쓰면됨
       return "/manager/memberList";
    }
	
	@GetMapping("/{memberId}")
	public String requestMemberById(@PathVariable String memberId, Model model) 
	{
		Member memberById = memberService.getMemberById(memberId);
		model.addAttribute("member", memberById); // member.jsp 에서 member. 해서 꺼내쓰면됨
		return "/manager/member";
	}
	
	@RequestMapping(value="/update")
    public String updateStatus(@RequestParam("id") String memberId) // 코치로 승급 
    {
		System.out.println("업데이트 코치코치 도착");
		memberService.updatePosition(memberId);
		
		return "redirect:/manager/all";	
    }
	@RequestMapping(value="/delete")
	public String getDeleteMember(@RequestParam("id") String memberId) 
	{
		memberService.setDeleteMember(memberId);
		return "redirect:/manager/all";
	}
	
	@RequestMapping(value="/coaches")
    public String requestUpdate(Model model) // 코치 리스트 보여주기
    {
		List<Coach> requestList = coachService.readAllCoachList();
		model.addAttribute("req", requestList);
		return "/manager/requestCoachList";
    }
	
	@GetMapping("/coach")
	public String requestProductById(@RequestParam("id") String coachId, Model model)
	{
		Coach chById = coachService.readCoachById(coachId);
		model.addAttribute("ch", chById); // product.jsp 에서 pd. 해서 꺼내쓰면됨

		return "/manager/reqCoach";
	}
	
	@GetMapping("/accept")
	public String acceptCoachById(@RequestParam("id") String coachId, Model model)
	{
		memberService.updatePosition(coachId);
		
		return "redirect:/manager/all";	
	}
	
	
}

