package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.UserDto;
import com.example.demo.service.ReservService;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	@Qualifier("us")
	private UserService service;
	
	@Autowired
	@Qualifier("ress")
	private ReservService rservice;
	
	@GetMapping("/user/user")
	public String user() {
		return service.user();
	}
	
	@GetMapping("/user/useridCheck")
	public @ResponseBody String useridCheck(HttpServletRequest request) {
		return service.useridCheck(request);
	}
	
	@PostMapping("/user/userOk")
	public String userOk(UserDto udto) {
		return service.userOk(udto);
	}
	
	@GetMapping("/user/userView")
	public String userView(HttpSession session, Model model) {
		return service.userView(session, model);
	}
	
	@PostMapping("/user/updateOk")
	public String chgEmail(HttpSession session, HttpServletRequest request, UserDto udto) {
		return service.updateOk(session, request, udto);
	}
	
	@GetMapping("/user/pwdCheck")
	public @ResponseBody String pwdCk(HttpSession session, HttpServletRequest request) {
		return service.pwdCheck(session, request);
	}
	
	@GetMapping("/user/myRsvDetail")
	public String myRsvDetail(@RequestParam String PNR, Model model) {
        return rservice.myRsvDetail(PNR, model);
    }
	
	
}
