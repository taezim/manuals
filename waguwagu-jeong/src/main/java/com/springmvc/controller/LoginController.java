package com.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.MemberVO;
import com.springmvc.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController 
{
	 //private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	    @Autowired
	    private LoginService loginService;

	    @GetMapping
	    public String LoginPage() {
	        return "common/LoginPage";
	    }

	    @PostMapping
	    public String Login(@RequestParam String id, @RequestParam String password) throws Exception {

	        String path = "";

	        MemberVO vo = new MemberVO();

	        vo.setId(id);
	        vo.setPassword(password);

	        int result = loginService.Login(vo);

	        if(result == 1) {
	            path = "main";
	        } else {
	            path = "common/LoginPage";
	        }

	        return path;

	    }
}
