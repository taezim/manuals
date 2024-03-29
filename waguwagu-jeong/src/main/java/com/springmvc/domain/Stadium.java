package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Stadium implements Serializable
{
	private static final long serialVersionUID = 7863752624987733679L;
	/**
	 * 
	 */
	// Constructor Field
	private String stadiumId;//경기장 번호
	private String city;// 시,도
	private String stdName;//
	
	//
	private String countryside;// 시군구
	private String ownership;//
	private String manager;
	private int siteArea;
	private int buildingArea;
	private int totalArea;
	private String infieldMaterial;
	private String outfieldMaterial;
	private int centerLength;
	private int baseLength; //1,3루 길이
	private int seatsNumber;// 관람객 좌석 수
	private int capacity; // 관람객 수용가능 인원
	private String builtYear;
	
	/* 파일 업로드 */
	private MultipartFile stdImage;
	private String fileName;
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountryside() {
		return countryside;
	}
	public void setCountryside(String countryside) {
		this.countryside = countryside;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getOwnership() {
		return ownership;
	}
	public void setOwnership(String ownership) {
		this.ownership = ownership;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public int getSiteArea() {
		return siteArea;
	}
	public void setSiteArea(int siteArea) {
		this.siteArea = siteArea;
	}
	public int getBuildingArea() {
		return buildingArea;
	}
	public void setBuildingArea(int buildingArea) {
		this.buildingArea = buildingArea;
	}
	public int getTotalArea() {
		return totalArea;
	}
	public void setTotalArea(int totalArea) {
		this.totalArea = totalArea;
	}
	public String getInfieldMaterial() {
		return infieldMaterial;
	}
	public void setInfieldMaterial(String infieldMaterial) {
		this.infieldMaterial = infieldMaterial;
	}
	public String getOutfieldMaterial() {
		return outfieldMaterial;
	}
	public void setOutfieldMaterial(String outfieldMaterial) {
		this.outfieldMaterial = outfieldMaterial;
	}
	public int getCenterLength() {
		return centerLength;
	}
	public void setCenterLength(int centerLength) {
		this.centerLength = centerLength;
	}
	public int getBaseLength() {
		return baseLength;
	}
	public void setBaseLength(int baseLength) {
		this.baseLength = baseLength;
	}
	public int getSeatsNumber() {
		return seatsNumber;
	}
	public void setSeatsNumber(int seatsNumber) {
		this.seatsNumber = seatsNumber;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getBuiltYear() {
		return builtYear;
	}
	public void setBuiltYear(String builtYear) {
		this.builtYear = builtYear;
	}
	
	
	
	public Stadium() {super();}
	
	public Stadium(String stadiumId, String city, String stdName) {
		super();
		this.stadiumId = stadiumId;
		this.city = city;
		this.stdName = stdName;
	}
	public String getStadiumId() {
		return stadiumId;
	}
	public void setStadiumId(String stadiumId) {
		this.stadiumId = stadiumId;
	}
	public MultipartFile getStdImage() {
		return stdImage;
	}
	public void setStdImage(MultipartFile stdImage) {
		this.stdImage = stdImage;
	}

}
