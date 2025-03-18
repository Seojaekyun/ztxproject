package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.RoutesService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RoutesController {
	@Autowired
	@Qualifier("rs")
	private RoutesService service;
	
	@GetMapping("/routes/search")
	public String routeSearch(@RequestParam String departure, @RequestParam String arrival,
			@RequestParam(required = false) String departureDate, @RequestParam(required = false) Integer resnum,
			@RequestParam(required = false) Integer charge, HttpSession session, Model model) {
		return service.routeSearch(departure, arrival, departureDate, resnum, charge, session, model);
	}
	
	@PostMapping("/routes/resCheck")
	public String resCheck(@RequestParam String routeid, @RequestParam String routeDeparture,
			@RequestParam String routeArrival, @RequestParam String routeTime,
			@RequestParam String routeArrivalTime, @RequestParam Integer resnum, // 선택된 인원
			@RequestParam(required = false, defaultValue = "") String[] goingSelectedSeats,  // 가는편 좌석 배열 기본값
			@RequestParam Integer charge, HttpServletRequest request, HttpSession session, Model model) {
		return service.resCheck(routeid, routeDeparture, routeArrival, routeTime,
				routeArrivalTime, resnum, goingSelectedSeats, charge, request, session, model);
	}
	
	@GetMapping("routes/seats")
	public String showSeatSelection(@RequestParam int routeid, @RequestParam int resnum,
			@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "50") int size, Model model) {
		return service.showSeatSelection(routeid, resnum, page, size, model);
	}
	
	@PostMapping("/confirmSeats")
	public String confirmSeats(@RequestParam int routeid, @RequestParam String selectedSeats,
			@RequestParam int resnum, HttpSession session, Model model) {
		return service.confirmSeats(routeid, selectedSeats, resnum, session, model);
	}
	
	@GetMapping("/routes/list")
	public String routeList(@RequestParam(required=false, defaultValue="1") Integer page, Model model) {
		return service.routeList(page, model);
	}

}
