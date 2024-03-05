package com.springmvc.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalInfo;
import com.springmvc.repository.HospitalInfoRepository;
import com.springmvc.service.Jdom;

import org.jdom2.Document;
import org.jdom2.Element;

@Controller
@RequestMapping("/hospitalinfo")
public class HospitalInfoController {
	
	@Autowired
    private Jdom jdom;
	
	@Autowired
	private HospitalInfoRepository hospitalInfoRepository;
	
	
	
	@GetMapping("/save")
	public String saveDate(Model model) {
		try {
			List<Map<String, String>> allDataList = jdom.readAllPages();
			hospitalInfoRepository.saveDataToDB(allDataList);
			return "Hospital/hospitals";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "Error occured : " +e.getMessage();
		}
	}
	
	@GetMapping("/list")
	public String getHospitalList(@RequestParam(defaultValue = "1") int page, Model model) {
		
		int itemslimit=15;
		//시작 인덱스 계산 
		int startIndex = (page - 1) * itemslimit;
		System.out.println("시작인덱스:"+startIndex);
		//15개씩 조회
		List<HospitalInfo> dataList = hospitalInfoRepository.findHospitalData(itemslimit, startIndex);
		
		//전체 수 조회
		int totalItemCount = hospitalInfoRepository.getTotalItemCount();
		System.out.println("전체수:"+totalItemCount);
		
		//총 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalItemCount / itemslimit);
		System.out.println("총페이지수:"+totalPages);
		model.addAttribute("totalItemCount", totalItemCount);
		model.addAttribute("dataList",dataList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages",totalPages);
		
		return "/Hospital/hospitals";
	}
	
	@GetMapping("/hospital")
	public String requestHospitalInfoById(@RequestParam("id") String id, Model model) {
		HospitalInfo hospitalInfoById = hospitalInfoRepository.readHospitalInfoById(id);
		model.addAttribute("hospitalInfo",hospitalInfoById);
		
		return "/Hospital/hospital";
	}
	
}
