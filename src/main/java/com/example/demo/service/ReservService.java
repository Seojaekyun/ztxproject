package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.ReservDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ReservService {
	String reservCheck(int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, int charge, String selectedSeats, HttpServletRequest request, Model model, HttpSession session);
	String reservConfirm(String userid, int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, int charge, String selectedSeats, Model model, HttpSession session);
	String list(HttpSession session, Model model, HttpServletRequest request);
	String payment(HttpSession session, HttpServletRequest request, Model model);
	String chargeOk(ReservDto rdto);
	String myRsvDetail(String PNR, Model model);
	String cancelOffer(ReservDto rdto);
	
	
}