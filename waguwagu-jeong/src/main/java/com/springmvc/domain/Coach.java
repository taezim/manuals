package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Coach implements Serializable
{
   /**
	 * 
	 */
	private static final long serialVersionUID = 7301972922437227014L;
	
	/*변수 총 8개 ! */
	private String coachId; //코치번호
	private String coachName;//코치이름
	private String certificate; //자격증
	private String career; //경력사항
	private String description; // 코치 소개
	private String classId; //개설한 클래스번호 //null
	
	/* 이미지 업로드 */
	private MultipartFile coachImage;
	private String fileName;
	
	public Coach() {super();};

	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getCoachName() {
		return coachName;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((coachId == null) ? 0 : coachId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Coach other = (Coach) obj;
		if (coachId == null) {
			if (other.coachId != null)
				return false;
		} else if (!coachId.equals(other.coachId))
			return false;
		return true;
	}


	public String getCoachId() {
		return coachId;
	}


	public void setCoachId(String coachId) {
		this.coachId = coachId;
	}


	public String getClassId() {
		return classId;
	}


	public void setClassId(String classId) {
		this.classId = classId;
	}

	public MultipartFile getCoachImage() {
		return coachImage;
	}

	public void setCoachImage(MultipartFile coachImage) {
		this.coachImage = coachImage;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
