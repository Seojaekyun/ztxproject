package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.demo.service.AdminService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@GetMapping("/admin/index")
	public String adminIndex(HttpSession session, HttpServletRequest request, Model model) {
		return service.adminIndex(session, request, model);
	}
	
	@GetMapping("/admin/reservList")
	public String reservList(@RequestParam(required=false) String selectedDate,
			@RequestParam(required=false, defaultValue="1") Integer seoulPage,
			@RequestParam(required=false, defaultValue="1") Integer pusanPage,
			@RequestParam(required=false, defaultValue="1") Integer otherPage,
			@RequestParam(required=false, defaultValue="1") Integer page, Model model) {
		return service.reservList(selectedDate, seoulPage, pusanPage, otherPage, page, model);
	}
	
	@GetMapping("/admin/rsvdList")
	public String rsvdList(HttpServletRequest request, Model model) {
		return service.rsvdList(request, model);
	}
	
}
