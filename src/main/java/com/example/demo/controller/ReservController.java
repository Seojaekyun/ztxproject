package com.example.demo.controller;

import com.example.demo.service.ReservService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservController {
	
	@Autowired
	@Qualifier("ress")
	private ReservService resService;
	
	@PostMapping("/reserv/reservCheck")
	public String reservCheck(@RequestParam int routeid, @RequestParam String routeDeparture,
			@RequestParam String routeArrival, @RequestParam String routeTime,
			@RequestParam String routeArrivalTime, @RequestParam String selectedSeats,
			@RequestParam int resnum, Model model, HttpSession session) {
		// 예약 처리 로직 추가
		return resService.reservCheck(routeid, routeDeparture, routeArrival, routeTime, routeArrivalTime, resnum, selectedSeats, model, session);
	}
	
	@PostMapping("/reserv/reservConfirm")
	public String reservConfirm(@RequestParam String userid, @RequestParam int routeid,
			@RequestParam String routeDeparture, @RequestParam String routeArrival,
			@RequestParam String routeTime, @RequestParam String routeArrivalTime,
			@RequestParam String selectedSeats, @RequestParam int resnum,
			Model model, HttpSession session) {
		// 예약 처리 로직 추가
		return resService.reservConfirm(userid, routeid, routeDeparture, routeArrival, routeTime, routeArrivalTime, resnum, selectedSeats, model, session);
	}
	
	@GetMapping("/reserv/list")
	public String list(Model model, HttpServletRequest request)
	{
		return resService.list(model, request);
	}
	
	
}