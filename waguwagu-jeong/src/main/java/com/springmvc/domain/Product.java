package com.springmvc.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Product implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1925519282386830473L;
	
	private String productId;//
	private String productName;//
	private int unitPrice;//
	private String description;
	private String category;
	private long unitsInStock;
	private String condition;
	
	/* 파일 업로드 */
	private MultipartFile productImage;
	private String fileName;
	
	private int accumulatedOrders; // 누적 주문 수
	private int rating; // 평균 상품 평점
	
	public Product() {super();} // super은 생략되어도 상관은 없는데 그냥 적자
	
	public Product(String productId,String productName,int unitPrice )
	{
		super();
		this.productId = productId;
		this.productName = productName;
		this.setUnitPrice(unitPrice);
	
	}
	
	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getAccumulatedOrders() {
		return accumulatedOrders;
	}
	public void setAccumulatedOrders(int accumulatedOrders) {
		this.accumulatedOrders = accumulatedOrders;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	
}
