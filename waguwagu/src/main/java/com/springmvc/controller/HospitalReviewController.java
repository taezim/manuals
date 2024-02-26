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

import com.springmvc.domain.HospitalReview;
import com.springmvc.service.HospitalReviewService;

@Controller
@RequestMapping("/hospital/review")
public class HospitalReviewController {
	
	@Autowired
	private HospitalReviewService hospitalReviewService;
	
	@GetMapping
	public String requestReviewList(Model model) {
		List<HospitalReview> list = hospitalReviewService.readAllReviewList();
		model.addAttribute("reviewList",list);
		return "/Hospital/reviews";
	}
	
	@GetMapping("/all")
	public String requestAllReviews(@RequestParam("id") String reviewId, Model model) {
		List<HospitalReview> list = hospitalReviewService.readAllReviewList();
		model.addAttribute("reviewList",list);
		return "/Hospital/reviews";
	}
	
	@GetMapping("/review")
	public String requestReviewById(@RequestParam("id") String reviewId, Model model){
		HospitalReview reviewById = hospitalReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		return "/Hospital/review";
	}
	
	//create
	@GetMapping("/add")
	public String requestAddReviewForm(@ModelAttribute("addReview")HospitalReview hospitalReview) {
		return "/Hospital/add";
	}
	
	@PostMapping("/add")
	public String submitAddNewReview(@ModelAttribute("addReview")HospitalReview hospitalReview, HttpServletRequest request) {
		MultipartFile img = hospitalReview.getReviewImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) 
		{
			try 
			{
				img.transferTo(saveFile);
				hospitalReview.setFileName(saveName);
			}
			catch(Exception e) 
			{
				throw new RuntimeException("리뷰 사진 업로드가 실패했습니다.");
			}
		}
		hospitalReviewService.setNewReview(hospitalReview);
		return "redirect:/reviews";
	}
	@GetMapping("/update")
	public String getUpdateReviewForm(@ModelAttribute("updateReview")HospitalReview hospitalReview, @RequestParam("id") String reviewId, Model model) {
		HospitalReview reviewById = hospitalReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		return "/Hospital/updateForm";
	}
	
	@PostMapping("/update")
	public String submitUpdateReviewForm(@ModelAttribute("updateReview")HospitalReview hospitalReview, HttpServletRequest request) {
		MultipartFile img = hospitalReview.getReviewImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) 
		{
			try 
			{
				img.transferTo(saveFile);
				hospitalReview.setFileName(saveName);
			}
			catch(Exception e) 
			{
				throw new RuntimeException("사진 업로드가 실패했습니다.");
			}
		}
		hospitalReviewService.setUpdateReview(hospitalReview);
		return "redirect:/reviews";
		
	}
	
	@GetMapping(value="/delete")
	public String getDeleteForm(Model model, @RequestParam("id") String reviewId) {
		hospitalReviewService.setDeleteReview(reviewId);
		return "redirect:/reviews";
	}

}
