package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ReservService {
	String reservCheck(int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, String selectedSeats, Model model, HttpSession session);
	String reservConfirm(String userid, int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, String selectedSeats, Model model, HttpSession session);
	String list(Model model, HttpServletRequest request);
	
	
}