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

import com.springmvc.domain.Productqna;
import com.springmvc.service.QnAProductService;

@Controller
@RequestMapping("/productquestion")
public class QnAProductController {

	@Autowired
	private QnAProductService qnaService;
	
	
	//Product
	
	//조회
	//전체조회
	@GetMapping //수정
	public String showAllproductqna(Model model)
	{
		System.out.println("qna 객체 전체 조회 controller");
		List<Productqna> productlist = qnaService.readAllProductqnaList();
		model.addAttribute("productqnaList", productlist);
		return "/question/productQnA/productqnas";
	}
	
	//하나조회
	@GetMapping("/productqna")
	public String showproductqna(@RequestParam("productnumber") String productnumber, Model model) {
	    System.out.println("qna 조회 controller");
	    Productqna productqnanumber = qnaService.readProductqnaBynumber(productnumber);
	    model.addAttribute("productqna", productqnanumber);
	    return "/question/productQnA/productqna";
	}
	
	//추가
	@GetMapping("/productadd")
	public String createGetqna(@ModelAttribute("productplus") Productqna newqna)
	{
		System.out.println("add getMapping");
		return "/question/productQnA/prodcutaddqna";
	}
	
	
	@PostMapping("/productadd")
	public String createPostqna(@ModelAttribute("productplus") Productqna qna) 
	{
		System.out.println("add postMapping");
	    
		qnaService.createProductlqna(qna);
	    return "redirect:/productquestion";
	}
	
	//수정
	@GetMapping("/productupdate")
	public String Updateproductqnaget(@ModelAttribute("productupdateqna") Productqna qnanumber,
			@RequestParam("productid") String productid, Model model) {
		 System.out.println("update getMapping");
	    Productqna productqna = qnaService.readProductqnaBynumber(productid);
	    model.addAttribute("product123", productqna);
	    
	    System.out.println(productqna.getNumber() );
	    System.out.println(productqna.getProductid() );
	    
	    return "/question/productQnA/productupdateqna";
	}
	
	
	@PostMapping("/productupdate")
	public String UpdateqnaForm(@ModelAttribute("productupdateqna") Productqna productqna) {
	    System.out.println("qnA 객체 가져옴 : " + productqna);
	    System.out.println("qnA의 Number: " + productqna.getNumber());
	    System.out.println("update postMapping");
	
	    qnaService.updateProductqna(productqna);
	    return "redirect:/productquestion";
	}
	
	//삭제
		@RequestMapping(value="/productdelete")
		public String deleteQnA(Model model, @RequestParam("productid") String productnumber)
		{
			qnaService.deleteProductqna(productnumber);
			return "redirect:/productquestion";
		}
}