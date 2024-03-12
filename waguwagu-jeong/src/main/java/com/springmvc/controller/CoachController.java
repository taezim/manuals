package com.springmvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Coach;
import com.springmvc.service.CoachService;



@Controller
@RequestMapping("/coaches")
public class CoachController 
{
	@Autowired
	private CoachService coachService;

	// READ
	@GetMapping
	public String requestCoachList(Model model) 
	{
		List<Coach> list = coachService.readAllCoachList(); 
		model.addAttribute("coachList", list);
		return "/Coach/coaches";
	}
	
	@GetMapping("/all")
	public String requestAllProducts(Model model) 
	{
		List<Coach> list = coachService.readAllCoachList(); 
		model.addAttribute("coachList", list);
		return "/Coach/coaches";
	}
	
	@GetMapping("/coach")
	public String requestProductById(@RequestParam("id") String coachId, Model model)
	{
		Coach chById = coachService.readCoachById(coachId);
		model.addAttribute("ch", chById); // product.jsp 에서 pd. 해서 꺼내쓰면됨

		return "/Coach/coach";
	}
	
	// CREATE

	@GetMapping("/add")
	public String requestAddProductForm(@ModelAttribute("addCoach")Coach coach, Authentication authentication) 
	{
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
        String userId = userDetails.getUsername();
        
		
		return "/Coach/addCoach?id="+userId;
		
	}

	@PostMapping("/add")
	public String submitAddNewProduct(@ModelAttribute("addCoach")Coach coach, HttpServletRequest request) 
	{
		MultipartFile img = coach.getCoachImage();
		String saveName = img.getOriginalFilename();
		System.out.println("이미지명 : "+saveName);
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		
		
		File saveFile = new File(save, saveName);
		if(img !=null&& ! img.isEmpty()) 
		{
			try {
				img.transferTo(saveFile);
				coach.setFileName(saveName); // 17단원 추가
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
			}
		}
		coachService.setNewCoach(coach);
		return "redirect:/coaches";
	}
	
	@GetMapping("/update")
	public String getUpdateBookForm(@ModelAttribute("updateCoach")Coach coach, @RequestParam("id") String coachId, Model model) 
	{
		Coach chById = coachService.readCoachById(coachId);
		model.addAttribute("ch", chById); // product.jsp 에서 ch. 해서 꺼내쓰면됨
		
		return "updateCoach";		
	}
	
	@PostMapping("/update")
	public String submitUpdateBookForm(@ModelAttribute("updateCoach")Coach coach, HttpServletRequest request) 
	{
		MultipartFile img = coach.getCoachImage();
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");

		File saveFile = new File(save, saveName);
		if(img!=null && !img.isEmpty()) 
		{
			System.out.println("이미지는 null이 아님");
			try {
				img.transferTo(saveFile);
				coach.setFileName(saveName); // 17단원 추가
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
			}
		}
		coachService.setUpdateCoach(coach);
		return "redirect:/coaches";		
	}
	
	
	@RequestMapping(value="/delete")
	public String getDeleteBookForm(Model model, @RequestParam("id") String coachId) 
	{
		coachService.setDeleteCoach(coachId);
		return "redirect:/coaches";
	}
}
