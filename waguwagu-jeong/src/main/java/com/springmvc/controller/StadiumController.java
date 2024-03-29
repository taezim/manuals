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

import com.springmvc.domain.Coach;
import com.springmvc.domain.Product;
import com.springmvc.domain.Stadium;
import com.springmvc.service.StadiumService;

@Controller
@RequestMapping("/stadiums")
public class StadiumController 
{

	@Autowired
	private StadiumService stadiumService;

	
	// READ
	@GetMapping
	public String requestStadiumList(Model model) 
	{
		List<Stadium> list = stadiumService.readAllStadiumList(); // 호출하니까 이동해야지
		model.addAttribute("stadiumList", list);
		return "/Stadium/stadiums";
	}
	
	@GetMapping("/all")
	public String requestAllStadiums(Model model) 
	{
		List<Stadium> list = stadiumService.readAllStadiumList(); // 호출하니까 이동해야지
		model.addAttribute("stadiumList", list);
		return "/Stadium/stadiums";
	}
	
	// CREATE

		@GetMapping("/add")
		public String requestAddStadiumForm(@ModelAttribute("addStadium")Stadium std) 
		{
			System.out.println("GetMapping 도착");
			return "/Stadium/addStadium";
			
		}

		@PostMapping("/add")
		public String submitAddNewStadium(@ModelAttribute("addStadium")Stadium std, HttpServletRequest request) 
		{
			MultipartFile img = std.getStdImage();
			
			String saveName = img.getOriginalFilename();
			String save = request.getSession().getServletContext().getRealPath("/resources/images");
			
			
			File saveFile = new File(save, saveName);
			if(img !=null&& ! img.isEmpty()) 
			{
				try {
					img.transferTo(saveFile);
					std.setFileName(saveName); // 17단원 추가
				} catch (Exception e) {
					// TODO Auto-generated catch block
					throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
				}
			}

			stadiumService.setNewStadium(std);
			return "redirect:/stadiums";
		}
		
		@GetMapping("/update")
		public String getUpdateBookForm(@ModelAttribute("updateStadium")Stadium std, @RequestParam("id") String stdId, Model model) 
		{
			Stadium stdById = stadiumService.readStadiumById(stdId);
			model.addAttribute("std", stdById); // product.jsp 에서 ch. 해서 꺼내쓰면됨
			
			return "/Stadium/updateStadium";		
		}
		
		@PostMapping("/update")
		public String submitUpdateBookForm(@ModelAttribute("updateStadium")Stadium std, HttpServletRequest request) 
		{
			MultipartFile img = std.getStdImage();
			String saveName = img.getOriginalFilename();
			String save = request.getSession().getServletContext().getRealPath("/resources/images");

			File saveFile = new File(save, saveName);
			if(img!=null && !img.isEmpty()) 
			{
				System.out.println("이미지는 null이 아님");
				try {
					img.transferTo(saveFile);
					std.setFileName(saveName); // 17단원 추가
				} catch (Exception e) {
					// TODO Auto-generated catch block
					throw new RuntimeException("상품 이미지 업로드가 실패하였습니다.");
				}
			}
			stadiumService.setUpdateStadium(std);
			return "redirect:/stadiums";		
		}
		
		
		@RequestMapping(value="/delete")
		public String getDeleteBookForm(Model model, @RequestParam("id") String stdId) 
		{
			return "redirect:/stadiums";
		}
}
