package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.demo.dto.GongjiDto;
import com.example.demo.service.GongjiService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GongjiController {
	
	@Autowired
	@Qualifier("gs")
	private GongjiService service;
	
	@GetMapping("/gongji/list")
	public String list(GongjiDto gdto, Model model, HttpServletRequest request) {
		return service.list(gdto, model, request);
	}
	
	@GetMapping("/gongji/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}
	
	@GetMapping("/gongji/content")
	public String content(HttpServletRequest request, Model model) {
		return service.content(request, model);
	}
	
	
}
