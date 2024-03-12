package com.springmvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Member;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController 
{
   
   @Autowired
   private MemberService memberService;
   
	/*추후 추가 예정*/
/*
   @GetMapping
   public String requestMemberList(Model model) {
      List<Member> list = memberService.readAllMemberList();
      model.addAttribute("memberList",list);
      return "member";
   }
   
   		
      @GetMapping("/me") // 나의 회원 정보 조회
      public String requestMemberById(@RequestParam("id") String memberId, Model model)
      {
         Member memberById = memberService.getMemberById(memberId);
         model.addAttribute("member", memberById); // product.jsp 에서 pd. 해서 꺼내쓰면됨

         return "";
      }
*/
   
   // 회원가입
   @GetMapping("/add")
   public String createMember(@ModelAttribute Member member, Model model) 
   {
      return "addMember";
   }
   
   @PostMapping("/add")
   public String submitCreateMember(@ModelAttribute Member member, HttpServletRequest request) 
   {
	  member.setPosition("선수");
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
      memberService.createNewMember(member);
      System.out.println("기본 등급 : " + member.getPosition());
      
      return "main"; // 메인페이지로 보낼예정
   }
   
   @GetMapping("/update")
   public String getUpdateMemberForm(@ModelAttribute("updateMember") Member member, @RequestParam("id") String memberId, Model model) 
   {
      Member memberById = memberService.getMemberById(memberId);
      model.addAttribute("member",memberById);
      return "updateForm";
   }
 
   @PostMapping("/update")
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
      return "main";
   }
   
   @DeleteMapping("/delete")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void deleteCartList(@PathVariable(value="memberId") String memberId) 
	{
		memberService.setDeleteMember(memberId);
	}
}