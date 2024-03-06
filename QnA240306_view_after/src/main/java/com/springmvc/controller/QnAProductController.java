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
	
	// 처음 페이지 진입 시 productqnaList를 조회합니다.
	 @GetMapping
	    public String showAllproductqna( Model model) {
	        System.out.println("qna 객체 전체 조회 controller");

	        Productqna newqna = new Productqna();
	        model.addAttribute("productplus", newqna);
	        System.out.println("newqna : "+newqna);
	        
	        
	        List<Productqna> productlist = qnaService.readAllProductqnaList();
	        model.addAttribute("productqnaList", productlist);
	        System.out.println("productlist : "+productlist);
	        
		    // productqna를 productupdateqna라는 모델 속성에 추가합니다.		    
	        return "/question/productQnA/productqnas";
	    }

	    // 추가
	    @PostMapping("/add")
	    public String createPostqna(@ModelAttribute("productplus") Productqna qna) {
	        System.out.println("add postMapping");
	        qnaService.createProductlqna(qna);
	        return "redirect:/productquestion";
	    }
	
	  //하나조회
		@GetMapping("/productqna")
		public String showproductqna(@RequestParam("productnumber") String productnumber, Model model) {
		    Productqna productqnanumber = qnaService.readProductqnaBynumber(productnumber);
		    model.addAttribute("productqna", productqnanumber);
		    return "/question/productQnA/productqnas";
		}
	
	@PostMapping("/productadd")
	public String createPostqna(@ModelAttribute("productplus") Productqna qna, Model model) {
		System.out.println("add postMapping");
		qnaService.createProductlqna(qna);
		List<Productqna> productqnaList = qnaService.readAllProductqnaList();
		model.addAttribute("productqnaList", productqnaList);
	
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
		    
		    return "/question/productQnA/productqnas";
		}
	
	
	@PostMapping("/productupdate")
	public String UpdateqnaForm(@ModelAttribute("productupdateqna") Productqna productqna) {
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