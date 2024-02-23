package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.HospitalReview;

public interface HospitalReviewRepository {

	List<HospitalReview> readAllReviewList();
	HospitalReview readReviewById(String reviewId);
	void setNewReview(HospitalReview hospitalReview);
	void setUpdateReview(HospitalReview hospitalReview);
	void setDeleteReview(String reviewId);
}
