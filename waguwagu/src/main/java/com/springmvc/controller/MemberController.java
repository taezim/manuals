package com.springmvc.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.Member;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping
	public String requestMemberList(Model model) {
		List<Member> list = memberService.readAllMemberList();
		model.addAttribute("memberList",list);
		return "member";
	}
	

	
	@GetMapping("/all")
	   public String requestAllBooks(Model model) 
	   {
	      List<Member> list = memberService.readAllMemberList(); // 호출하니까 이동
	      model.addAttribute("memberList", list);
	      return "member";
	   }
	
	   @GetMapping("/search")
	   public String requestProductById(@RequestParam("id") String memberId, Model model)
	   {
	      Member memberById = memberService.getMemberById(memberId);
	      model.addAttribute("m", memberById); // product.jsp 에서 pd. 해서 꺼내쓰면됨

	      return "member";
	   }

	
	@GetMapping("/createmember")
	public String createMember(@ModelAttribute Member member, Model model) {
//		MemberService.CreateNewMember(Member);
		return "createMember";
	}
	
	@PostMapping("/createmember")
	public String submitCreateMember(@ModelAttribute Member member, HttpServletRequest request) {
		//MemberService.CreateNewMember(Member);
		
		MultipartFile img = member.getMemberImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		File saveFile = new File(save, saveName);
		
		if(img != null && !img.isEmpty()) {
			try {
				img.transferTo(saveFile);
				member.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("프로필 이미지 업로드 실패.");
			}
		}
		
		System.out.println("SubmitCreateMember");
		System.out.println("id : " +member.getMemberId());
		System.out.println("pw : " +member.getPassword());
		System.out.println("birth : " +member.getBirth());		
		
		memberService.createNewMember(member);
		return "new";
	}
	
	@GetMapping("/updatemember")
	public String getUpdateMemberForm(@ModelAttribute("updateBook") Member member, @RequestParam("id") String memberId, Model model) {
		Member memberById = memberService.getMemberById(memberId);
		model.addAttribute("member",memberById);
		return "updateFrom";
	}
	
	@PostMapping("updatemember")
	public String submitUpdateMemberForm(@ModelAttribute("updateMember") Member member, HttpServletRequest request) {
		MultipartFile memberImage = member.getMemberImage();
		String saveName = memberImage.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save, saveName);
		
		if(memberImage != null && !memberImage.isEmpty()) {
			try {
				memberImage.transferTo(saveFile);
				member.setFileName(saveName);
			}
			catch(Exception e) {
				throw new RuntimeException("Member Image saving failed", e);
			}
		}
		memberService.setUpdateMemeber(member);
		return "member";
	}
	
	@GetMapping("/deletemember")
	public String deleteMember() {
		return "deleteMeber";
	}
}
