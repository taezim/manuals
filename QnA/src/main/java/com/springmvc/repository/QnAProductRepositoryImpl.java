package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Classqna;
import com.springmvc.domain.Hospitalqna;
import com.springmvc.domain.Productqna;

@Repository
public class QnAProductRepositoryImpl implements QnAProductRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}

	private List<Hospitalqna> listOfhospitalqna = new ArrayList<Hospitalqna>();
	private List<Productqna> listOfproductqna = new ArrayList<Productqna>();
	private List<Classqna> listOfclassqna = new ArrayList<Classqna>();

	@Override
	public List<Productqna> readAllProductqnaList() {
	    // TODO Auto-generated method stub
	    String SQL = "SELECT * FROM productqna";
	    List<Productqna> listOfProductqna = template.query(SQL, new ProductQnARowMapper());
	    return listOfProductqna;
	}

	@Override
	public Productqna readProductqnaBynumber(String productnumber) {
	    // TODO Auto-generated method stub
	    System.out.println("qna 조회 Repository");
	    Productqna productqnaInfo = null;

	    String SQL = "select count(*) from productqna where productid=?";
	    int rowCount = template.queryForObject(SQL, Integer.class, productnumber);
	    if (rowCount != 0) {
	        SQL = "select * from productqna where productid = ?";
	        productqnaInfo = template.queryForObject(SQL, new Object[] {productnumber}, new ProductQnARowMapper());
	    }
	    System.out.println(productqnaInfo);
	    return productqnaInfo;
	}

	@Override
	public List<Productqna> readProductqnaListByCategory(String category) {
	    // TODO Auto-generated method stub
	    return null;
	}

	@Override
	public void createProductlqna(Productqna productqna) {
	    // TODO Auto-generated method stub
	    System.out.println("add Repository");
	    String SQL = "INSERT INTO productqna (number,content,email,date,productid)" + "VALUES(?,?,?,?,?)";
	    
	    template.update(SQL, productqna.getNumber(), productqna.getContent(), productqna.getEmail(),
	            productqna.getDate(), productqna.getProductid());
	    
	    listOfproductqna.add(productqna);
	}

	@Override
	public void updateProductqna(Productqna productqna) {
	     System.out.println("qna update Repository");
	    System.out.println("qna: " + productqna);
	    System.out.println("qna number: " + productqna.getProductid());

	    String SQL = "UPDATE productqna SET content=?, email=?, date=?  WHERE productid=?";
	    template.update(SQL, productqna.getContent(), productqna.getEmail(), productqna.getDate(), productqna.getProductid());
	    
	}

	@Override
	public void deleteProductqna(String number) {
	    // TODO Auto-generated method stub
	    String SQL = "delete from productqna where productid = ?";
	    this.template.update(SQL, number);
	}
	
	
	
	

}
