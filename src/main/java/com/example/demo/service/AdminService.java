package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface AdminService {
	String adminIndex(HttpSession session, HttpServletRequest request, Model model);
	String reservList(String selectedDate, Integer seoulPage, Integer pusanPage, Integer otherPage, Integer page,
			Model model);
	String rsvdList(HttpServletRequest request, Model model);
	String routesList(Integer page, String selectedDate, String routeType, Model model);
	

}
