package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class LessonReview implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 546339524298037657L;
	
	
	private String reviewId;
	private String lessonId;
	private String userId;  //사용자아이디
	private String date;
	private String content;
	private int score;
	private String fileName;
	private MultipartFile reviewImage;
	
	public LessonReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}

	public String getLessonId() {
		return lessonId;
	}

	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(MultipartFile reviewImage) {
		this.reviewImage = reviewImage;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
