package com.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Classqna;
import com.springmvc.service.QnAClassService;

@Controller
@RequestMapping("/classquestion")
public class QnAClassController {

	@Autowired
	private QnAClassService qnaService;
	
	
	//Class
	
	//조회
	//전체조회
	@GetMapping //수정
	public String showAllClassqna(Model model)
	{
		System.out.println("qna 객체 전체 조회 controller");
		List<Classqna> classList = qnaService.readAllClassqnaList();
		model.addAttribute("classqnaList", classList);
		return "/question/classQnA/classqnas";
	}
	//하나조회
	@GetMapping("/classqna")
	public String showClassqna(@RequestParam("classnumber") String classnumber, Model model) {
	    System.out.println("qna 조회 controller");
	    Classqna classqnaNumber = qnaService.readClassqnaBynumber(classnumber);
	    model.addAttribute("classqna", classqnaNumber);
	    return "/question/classQnA/classqna";
	}
	//추가
	@GetMapping("/classadd")
	public String createGetqna(@ModelAttribute("classplus") Classqna newqna)
	{
		System.out.println("add getMapping");
		return "/question/classQnA/classaddqna";
	}
	
	
	@PostMapping("/classadd")
	public String createPostqna(@ModelAttribute("classplus") Classqna qna)
	{
		System.out.println("add postMapping");
		qnaService.createClassqna(qna);
	    return "redirect:/classquestion";
	}
	
	//수정
	@GetMapping("/classupdate")
	public String updateClassqnaGet(@ModelAttribute("classupdateqna") Classqna qnaNumber,
			@RequestParam("classid") String classid, Model model) {
		 System.out.println("update getMapping");
	    Classqna classqna = qnaService.readClassqnaBynumber(classid);
	    model.addAttribute("class123", classqna);
	    
	    System.out.println(classqna.getNumber() );
	    System.out.println(classqna.getClassid() );
	    
	    return "/question/classQnA/classupdateqna";
	}
	
	
	@PostMapping("/classupdate")
	public String updateqnaForm(@ModelAttribute("classupdateqna") Classqna classqna) {
	    System.out.println("qna 객체 가져옴 : " + classqna);
	    System.out.println("qna의 Number: " + classqna.getNumber());
	    System.out.println("update postMapping");
	
	    qnaService.updateClassqna(classqna);
	    return "redirect:/classquestion";
	}
	
	//삭제
	@RequestMapping(value="/classdelete")
	public String deleteqna(Model model, @RequestParam("classid") String classnumber)
	{
		qnaService.deleteClassqna(classnumber);
		return "redirect:/classquestion";
	}
}