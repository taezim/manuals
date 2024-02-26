package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.HospitalReview;

public interface HospitalReviewService {
	List<HospitalReview> readAllReviewList();
	HospitalReview readReviewById(String reviewId);
	void setNewReview(HospitalReview hospitalReview);
	void setUpdateReview(HospitalReview hospitalReview);
	void setDeleteReview(String reviewId);
}
