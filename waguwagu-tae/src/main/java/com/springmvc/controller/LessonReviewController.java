package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
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

import com.springmvc.domain.LessonReview;
import com.springmvc.service.LessonReviewService;

@Controller
@RequestMapping("/lesson/review")
public class LessonReviewController {

	@Autowired
	private LessonReviewService lessonReviewService;
	
	
	@GetMapping()
	public String requestReviewList(@RequestParam("id")String lessonId, Model model) {
		List<LessonReview> list = lessonReviewService.readAllReviewList(lessonId);
		double avgScore = lessonReviewService.calculateAvgScore(lessonId);
		model.addAttribute("reviewList",list);
		model.addAttribute("avgScore",avgScore);
		
		return "/Lesson/reviews";
		
	}
	
	@GetMapping("/all")
	public String requestAllReview(@RequestParam("id")String reviewId, @RequestParam("lessonId")String lessonId, Model model) {
		List<LessonReview> list = lessonReviewService.readAllReviewList(lessonId);
		model.addAttribute("reviewList",list);
		return "/Lesson/reviews";
	}
	
	@GetMapping("/detaile")
	public String requestReviewById(@RequestParam("id")String reviewId,Model model) {
		LessonReview reviewById = lessonReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		return "/Lesson/review";
	}
	
	//create
	@GetMapping("/add")
	public String requestAddReviewForm(@ModelAttribute("addReview")LessonReview lessonreview) {
		return "/Lesson/radd";
	}
	
	
	@PostMapping("/add")
	public String submitAddNewReview(@ModelAttribute("addReview")LessonReview lessonReview, HttpServletRequest request) {
		MultipartFile img = lessonReview.getReviewImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/response/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) 
		{
			try 
			{
				img.transferTo(saveFile);
				lessonReview.setFileName(saveName);
			} 
			catch (Exception e) 
			{
				throw new RuntimeException("리뷰 사진 업로드가 실패했습니다.");
			
			}
			
		}
		lessonReviewService.setNewReview(lessonReview);
		return "redirect:/Lesson/review";
			
	}	
	
	//update
	
	@GetMapping("/update")
	public String getUpdateReviewForm(@ModelAttribute("updateReview")LessonReview lessonReview, @RequestParam("id")String reviewId, Model model) {
		LessonReview reviewById = lessonReviewService.readReviewById(reviewId);
		model.addAttribute("review",reviewById);
		return "/Lesson/rupdateForm";
	}
	
	
	@PostMapping("/update")
	public String submitUpdateReviewForm(@ModelAttribute("updateReview")LessonReview lessonReview, HttpServletRequest request) {
		MultipartFile img = lessonReview.getReviewImage();
		
		String saveName = img.getOriginalFilename();
		String save = request.getSession().getServletContext().getRealPath("/response/images");
		File saveFile = new File(save,saveName);
		
		if(img!=null&&!img.isEmpty()) 
		{
			try 
			{
				img.transferTo(saveFile);
				lessonReview.setFileName(saveName);
			} 
			catch (Exception e) 
			{
				throw new RuntimeException("리뷰 사진 업로드가 실패했습니다.");
			
			}
			
		}
		lessonReviewService.setUpdateReview(lessonReview);
		return "redirect:/lesson/review";
	}
	
	@GetMapping(value="/delete")
	public String getDeleteForm(Model model, @RequestParam("id")String reviewId) {
		lessonReviewService.setDeleteReview(reviewId);
		return "redirect:/lesson/review";
	}
	
//	@GetMapping("/avg")
//	public String getAvgScore(Model model){
//		double avgScore = lessonReviewService.calculateAvgScore();
//		model.addAttribute("avgScore",avgScore);
//		return "/Lesson/reviews";
//	}
	

}
