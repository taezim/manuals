package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.HospitalReview;

@Repository
public class HospitalReviewRepositoryImpl implements HospitalReviewRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	

	@Override
	public List<HospitalReview> readAllReviewList() {
		String SQL = "SELECT * FROM h_review";
		List<HospitalReview> listOfReviews = template.query(SQL, new HospitalReviewRowMapper());
		return listOfReviews;
	}

	@Override
	public HospitalReview readReviewById(String reviewId) {
		HospitalReview reviewInfo = null;
		
		String SQL = "SELECT COUNT(*) FROM h_review WHERE hr_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, reviewId);
		
		if(rowCount!=0) {
			SQL="SELECT * FROM h_review WHERE hr_id=?";
			reviewInfo = template.queryForObject(SQL, new Object[] {reviewId}, new HospitalReviewRowMapper());
		}
		if(reviewInfo==null) {
			throw new IllegalArgumentException("일치하는 리뷰를 찾을 수 없습니다.");
		}
		return reviewInfo;
	}

	@Override
	public void setNewReview(HospitalReview hospitalReview) {
		String SQL = "INSERT INTO h_review (hr_id,hr_hospitalId,hr_userId,hr_date,hr_content,hr_rating,hr_filename)"+"VALUES(?,?,?,?,?,?,?)";
		template.update(SQL,hospitalReview.getReviewId(),hospitalReview.getHospitalId(),hospitalReview.getUserId(),hospitalReview.getReviewDate(),hospitalReview.getReviewContent(),hospitalReview.getReviewRating(),hospitalReview.getFileName());
	}

	@Override
	public void setUpdateReview(HospitalReview hospitalReview) {
		if(hospitalReview.getFileName()!=null) {
			String SQL = "UPDATE h_review SET hr_hospitalId=?,hr_userId=?,hr_date=?,hr_content=?,hr_rating=?,hr_filename=? WHERE hr_id=?";
			template.update(SQL,hospitalReview.getHospitalId(),hospitalReview.getUserId(),hospitalReview.getReviewDate(),hospitalReview.getReviewContent(),hospitalReview.getReviewRating(),hospitalReview.getReviewImage(),hospitalReview.getReviewId());
			
		}
		else if(hospitalReview.getFileName()==null) {
			String SQL = "UPDATE h_review SET hr_hospitalId=?,hr_userId=?,hr_date=?,hr_content=?,hr_rating=? WHERE hr_id=?";
			template.update(SQL,hospitalReview.getHospitalId(),hospitalReview.getUserId(),hospitalReview.getReviewDate(),hospitalReview.getReviewContent(),hospitalReview.getReviewRating(),hospitalReview.getReviewId());
		}
		
	}

	@Override
	public void setDeleteReview(String reviewId) {

		String SQL = "DELETE FROM h_review WHERE hr_id=?";
		this.template.update(SQL,reviewId);
	}

}
