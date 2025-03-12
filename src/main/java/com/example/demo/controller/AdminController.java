package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;
import com.example.demo.dto.StationsDto;
import com.example.demo.dto.TrainesDto;
import com.example.demo.service.AdminService;
import com.example.demo.service.GongjiService;
import com.example.demo.service.RoutesService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@Autowired
	@Qualifier("rs")
	private RoutesService rservice;
	
	@Autowired
	@Qualifier("gs")
	private GongjiService gservice;
	
	@GetMapping("/admin/index")
	public String adminIndex(HttpSession session, HttpServletRequest request, Model model) {
		return service.adminIndex(session, request, model);
	}
	
	@GetMapping("/admin/reservList")
	public String reservList(@RequestParam(required=false) String selectedDate,
			@RequestParam(required=false, defaultValue="1") Integer seoulPage,
			@RequestParam(required=false, defaultValue="1") Integer pusanPage,
			@RequestParam(required=false, defaultValue="1") Integer otherPage,
			@RequestParam(required=false, defaultValue="1") Integer page, Model model) {
		return service.reservList(selectedDate, seoulPage, pusanPage, otherPage, page, model);
	}
	
	@GetMapping("/admin/rsvdList")
	public String rsvdList(HttpServletRequest request, Model model) {
		return service.rsvdList(request, model);
	}
	
	@GetMapping("/admin/routesList")
	public String routesList(@RequestParam(required=false, defaultValue="1") Integer page,
			@RequestParam(required=false) String selectedDate,
			@RequestParam(required=false, defaultValue="all") String routeType, Model model) {
		return service.routesList(page, selectedDate, routeType, model);
	}
	
	@GetMapping("/admin/addRoute")
	public String showAddRouteForm(Model model) {
		List<StationsDto> stations = rservice.getAllStations();
		List<TrainesDto> traines = rservice.getAllTraines();
		model.addAttribute("stations", stations);
		model.addAttribute("traines", traines);
		return "admin/addRoute";
	}
	
	@PostMapping("/admin/addRoutes")
	public String addRoutes(
			@RequestParam String departure, @RequestParam String arrival, @RequestParam String departureTime,
			@RequestParam String arrivalTime, @RequestParam("ftimeValue") String ftime, @RequestParam int trainid,
			@RequestParam int unitPrice, @RequestParam String returnDeparture, @RequestParam String returnArrival,
			@RequestParam String returnDepartureTime, @RequestParam String returnArrivalTime,
			@RequestParam("returnFtimeValue") String returnFtime, @RequestParam int returnTrainid, @RequestParam int returnUnitPrice,
			Model model) {
		
		try {
			rservice.addRoute(departure, arrival, departureTime, arrivalTime, ftime, trainid, unitPrice);
			rservice.addRoute(returnDeparture, returnArrival, returnDepartureTime, returnArrivalTime, returnFtime, returnTrainid, returnUnitPrice);
			
			model.addAttribute("message", "성공적으로 추가되었습니다.");
		}
		catch (Exception e) {
			model.addAttribute("message", "오류가 발생했습니다: " + e.getMessage());
			return "admin/addRoute";  // 오류 발생 시 다시 항공편 추가 페이지로
		}
		
		// 항공편 목록 페이지로 리다이렉트
		return "redirect:/admin/routesList";
	}
	
	@GetMapping("/admin/getRouteTime")
	@ResponseBody
	public Map<String, Integer> getRouteTime(@RequestParam String departure, @RequestParam String arrival) {
		int[] routeTime = rservice.getRouteTime(departure, arrival);
		
		Map<String, Integer> response = new HashMap<>();
		response.put("hour", routeTime[0]);
		response.put("minute", routeTime[1]);
		response.put("unitPrice", routeTime[2]);
		
		return response;
	}
	
	@PostMapping("/admin/addSeats")
	public String addSeats() { // flightId는 내부에서 처리되므로 전달하지 않음
		rservice.addSeatsForRoute();
		return "redirect:/admin/routesList";  // 완료 후 항공편 목록 페이지로 이동
	}
  
  @GetMapping("/admin/rsvChart")
	public String rsvChart(Model model) {
		return service.rsvChart(model);
	}
	
	@GetMapping("/admin/gongjiList")
	public String gongjiList(GongjiDto gdto, Model model) {
		return gservice.gongjiList(gdto, model);
  }
  
  
}