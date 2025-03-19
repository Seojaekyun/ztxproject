package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.UserDto;
import com.example.demo.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@GetMapping("/login/login")
	public String login(HttpServletRequest request, Model model) {
		return service.login(request, model);
	}
	
	@PostMapping("/login/loginOk")
	public String loginOk(UserDto udto, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return service.loginOk(udto, request, response, session);
	}
	
	@GetMapping("/login/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
	
	@GetMapping("/login/fUserid")
	public String fUserid() {
		return service.fUserid();
	}
	
	@GetMapping("/login/getUserid")
	public @ResponseBody String getUserid(UserDto udto) {
		return service.getUserid(udto);
	}
	
	@GetMapping("/login/fPassword")
	public String fPassword() {
		return service.fPassword();
	}
	
	@GetMapping("/login/getPwd")
	public @ResponseBody String getPwd(UserDto udto) throws Exception {
		return service.getPwd(udto);
	}
	
	@GetMapping("/login/loginAd")
	public String loginAd(HttpServletRequest request, Model model) {
		return service.loginAd(request,model);
	}
	
	@PostMapping("/login/loginAdmin")
	public String loginAdmin(UserDto udto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return service.loginAdmin(udto,session,request,response);
	}
	
	
}
