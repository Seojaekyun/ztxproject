package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface RoutesService {
	String routeSearch(String departure, String arrival, String departureDate, Integer resnum, Integer charge, HttpSession session, Model model);
	String resCheck(String routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, Integer resnum, String[] goingSelectedSeats, Integer charge, HttpServletRequest request, HttpSession session, Model model);
	String showSeatSelection(int routeid, int resnum, int page, int size, Model model);
	String confirmSeats(int routeid, String selectedSeats, int resnum, HttpSession session, Model model);
	int[] getRouteTime(String departure, String arrival);
	
	
}
