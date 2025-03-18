package com.example.demo.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.ReviewDto;
import com.example.demo.service.ReviewService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	
	@Autowired
	@Qualifier("rev")
	private ReviewService service;
	
	@GetMapping("/review/list")
	public String list(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.list(request, model, session);
	}
	
	@GetMapping("/review/readnum")
	public String readnum(HttpSession session, HttpServletRequest request)
	{
		return service.readnum(session, request);
	}
	
	@GetMapping("/review/content")
	public String content(HttpSession session, HttpServletRequest request, Model model)
	{
		return service.content(session, request, model);
	}
	
	@GetMapping("/review/write")
	public String write()
	{
		return "/review/write";
	}
	
	@PostMapping("/review/writeOk")
	public String writeOk(ReviewDto revdto, MultipartFile file, HttpSession session) throws IOException
	{
		return service.writeOk(revdto, file, session);
	}
	

}
