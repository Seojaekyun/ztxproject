package com.example.demo.controller;

import com.example.demo.dto.ReservDto;
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
	private ReservService service;
	
	@PostMapping("/reserv/reservCheck")
	public String reservCheck(@RequestParam int routeid, @RequestParam String routeDeparture,
			@RequestParam String routeArrival, @RequestParam String routeTime,
			@RequestParam String routeArrivalTime, @RequestParam String selectedSeats,
			@RequestParam int resnum, @RequestParam int charge, HttpServletRequest request, Model model, HttpSession session) {
		// 예약 처리 로직 추가
		return service.reservCheck(routeid, routeDeparture, routeArrival, routeTime, routeArrivalTime, resnum, charge, selectedSeats, request, model, session);
	}
	
	@PostMapping("/reserv/reservConfirm")
	public String reservConfirm(@RequestParam String userid, @RequestParam int routeid,
			@RequestParam String routeDeparture, @RequestParam String routeArrival,
			@RequestParam String routeTime, @RequestParam String routeArrivalTime,
			@RequestParam String selectedSeats, @RequestParam int resnum, @RequestParam int charge,
			Model model, HttpSession session) {
		// 예약 처리 로직 추가
		return service.reservConfirm(userid, routeid, routeDeparture, routeArrival, routeTime, routeArrivalTime, resnum, charge, selectedSeats, model, session);
	}
	
	@GetMapping("/reserv/list")
	public String list(HttpSession session, Model model, HttpServletRequest request) {
		return service.list(session, model, request);
	}
	
	@GetMapping("/reserv/payment")
	public String payment(HttpSession session, HttpServletRequest request, Model model) {
		return service.payment(session, request, model);
	}
	
	@PostMapping("/reserv/chargeOk")
	public String chargeOk(ReservDto rdto) {
		return service.chargeOk(rdto);
	}
	
	@GetMapping("/reserv/cancelOffer")
	public String cancelOffer(ReservDto rdto) {
		return service.cancelOffer(rdto);
	}
	
	@GetMapping("/reserv/oneRsvDetail")
	public String oneRsvDetail(@RequestParam String PNR, Model model) {
        return service.oneRsvDetail(PNR, model);
    }
	
}