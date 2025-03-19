package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;
import com.example.demo.dto.UserDto;
import com.example.demo.service.AdminService;
import com.example.demo.service.GongjiService;
import com.example.demo.service.RoutesService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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
	public String addRoute(Model model) {
		return service.addRoute(model);
	}
	
	@PostMapping("/admin/addRoutes")
	public String addRoutes(
			@RequestParam String departure, @RequestParam String arrival, @RequestParam String departureTime,
			@RequestParam String arrivalTime, @RequestParam("ftimeValue") String ftime, @RequestParam int trainid,
			@RequestParam int unitPrice, @RequestParam String returnDeparture, @RequestParam String returnArrival,
			@RequestParam String returnDepartureTime, @RequestParam String returnArrivalTime,
			@RequestParam("returnFtimeValue") String returnFtime, @RequestParam int returnTrainid, @RequestParam int returnUnitPrice,
			Model model, RedirectAttributes redirectAttributes) {
		return service.addRoutes(departure, arrival, departureTime, arrivalTime, ftime, trainid,
				unitPrice, returnDeparture, returnArrival, returnDepartureTime, returnArrivalTime,
				returnFtime, returnTrainid, returnUnitPrice, model, redirectAttributes);
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
	
	@GetMapping("/admin/rsvChart")
	public String rsvChart(Model model) {
		return service.rsvChart(model);
	}
	
	@GetMapping("/admin/gongjiList")
	public String gongjiList(GongjiDto gdto, Model model, HttpServletRequest request) {
		return gservice.gongjiList(gdto, model, request);
	}
	
	@GetMapping("/admin/gongjiWrite")
	public String gongjiWrite() {
		return gservice.gongjiWrite();
	}
	
	@PostMapping("/admin/gongjiWriteOk")
	public String gongjiWriteOk(GongjiDto gdto) {
		return gservice.gongjiWriteOk(gdto);
	}
	
	@GetMapping("/admin/gongjiContent")
	public String gongjiContent(HttpServletRequest request, Model model) {
		return gservice.gongjiContent(request, model);
	}
	
	@GetMapping("/admin/gongjiUpdate")
	public String gongjiUpdate(HttpServletRequest request, Model model) {
		return gservice.gongjiUpdate(request, model);
	}
	
	@PostMapping("/admin/gongjiUpdateOk")
	public String gongjiUpdateOk(HttpServletRequest request, GongjiDto gdto) {
		return gservice.gongjiUpdateOk(request, gdto);
	}
	
	@GetMapping("/admin/gongjiDelete")
	public String gongjiDelete(HttpServletRequest request) {
		return gservice.gongjiDelete(request);
	}
	
	
	@GetMapping("/admin/inquiryList")
	public String inquiryList(@RequestParam(defaultValue = "1") int page, Model model) {
		return service.inquiryList(page,model);
	}
	
	@GetMapping("/admin/inquiryAnswer")
	public String answer(@RequestParam int id, Model model) {
		return service.answer(id, model);
	}
	
	@PostMapping("/admin/answerOk")
	public String answerOk(@RequestParam int id, @RequestParam String answer) {
		return service.answerOk(id, answer);
	}
	
	@GetMapping("/admin/answerDel")
	public String answerDel(@RequestParam int id) {
		return service.answerDel(id);
	}
	
	@GetMapping("/admin/memberList")
	public String memberList(HttpServletRequest request, Model model) {
		return service.memberList(request, model);
	}
	
	@GetMapping("/admin/memberUp")
	public String memberUp(UserDto mdto, @RequestParam int id, @RequestParam int level, Model model) {
		return service.memberUp(mdto, id, level, model);
	}
	
	@GetMapping("/admin/oneMeminfo")
	public String oneMeminfo(HttpServletRequest request, Model model) {
		return service.oneMeminfo(request, model);
	}
	
	@GetMapping("/admin/cancelConfirm")
	public String cancelConfirm(HttpServletRequest request) {
		return service.cancelConfirm(request);
	}
	
	@GetMapping("/admin/cancelRejection")
	public String cancelRejection(HttpServletRequest request, Model model) {
		return service.cancelRejection(request, model);
	}
	
	@GetMapping("/admin/payReturn")
	public String payReturn(HttpServletRequest request, Model model) {
		return service.payReturn(request, model);
	}



}