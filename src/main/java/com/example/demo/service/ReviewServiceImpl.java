package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.ReviewDto;
import com.example.demo.mapper.ReviewMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("rev")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;

	@Override
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		if(userid == null) {
			return "redirect:/login/login";
		}
		else {
			int index=0;
			ArrayList<ReviewDto> revlist=mapper.list(index);
			model.addAttribute("revlist", revlist);
			
			return "/review/list"; 
		}
	}
	
	
}
