package com.springmvc.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/order/history")
public class OrderHistoryController 
{
	@GetMapping
	public String requestBySessionId(HttpServletRequest request) 
	{
		 String sessionId = request.getSession(true).getId();
	     System.out.println("requestBySession id 실행" + sessionId);
		
	     return "/OrderHistory/orders";
	}
	@GetMapping("/all")
	public String requestOrderList(Model model, HttpServletRequest request) 
	{
		
		
		
		return "/OrderHistory/orders";
		
	}
	
	
	
	
	
}
