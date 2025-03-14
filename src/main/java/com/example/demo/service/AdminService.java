package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface AdminService {
	String adminIndex(HttpSession session, HttpServletRequest request, Model model);
	String reservList(String selectedDate, Integer seoulPage, Integer pusanPage, Integer otherPage, Integer page,
			Model model);
	String rsvdList(HttpServletRequest request, Model model);
	String routesList(Integer page, String selectedDate, String routeType, Model model);
	String rsvChart(Model model);
	String adminInquiryList(int page,Model model);
	String adminInquiryAnswer(int id, Model model);
	void adminInquiryAnswerOk(int id, String answer);
    void adminInquiryAnswerDelete(int id);
	String memberList(HttpServletRequest request, Model model);
	String memberUp(UserDto mdto, int id, int level, Model model);
	String oneMeminfo(HttpServletRequest request, Model model);
}
