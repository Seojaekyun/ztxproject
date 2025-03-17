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
	String adminInquiryAnswerOk(int id, String answer);
    String adminInquiryAnswerDelete(int id);
	String memberList(HttpServletRequest request, Model model);
	String memberUp(UserDto mdto, int id, int level, Model model);
	String oneMeminfo(HttpServletRequest request, Model model);
	String cancelConfirm(HttpServletRequest request);
	String cancelRejection(HttpServletRequest request, Model model);
	String payReturn(HttpServletRequest request, Model model);
	String addRoute(Model model);
	String addRoutes(String departure, String arrival, String departureTime, String arrivalTime, String ftime,
			int trainid, int unitPrice, String returnDeparture, String returnArrival, String returnDepartureTime,
			String returnArrivalTime, String returnFtime, int returnTrainid, int returnUnitPrice, Model model);
	
	
}
