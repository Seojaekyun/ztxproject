package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.demo.service.MainService;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MainController {
	@Autowired
	@Qualifier("ms")
	private MainService service;
	
	@GetMapping("/")
	public String home() {
		return "redirect:/main/index";
	}
	
	@GetMapping("/main/index")
	public String index(HttpServletRequest request, Model model) {
		return service.index(request, model);
	}
	
	@PostMapping("/main/sendMessage")
	@ResponseBody
	public String sendMessage(@RequestParam String message, @RequestParam boolean isAdmin) {
	    return service.saveMessage(message, isAdmin);  // 로직을 서비스로 넘김
	}
	
	// 메시지 가져오기
	@GetMapping("/main/getMessages")
	@ResponseBody
	public List<String> getMessages() {
		return service.getMessages();
	}
	
	@PostMapping("/main/resetChatHistory")
	@ResponseBody
	public String resetChatHistory() {
		// 채팅 기록을 리셋하는 서비스 로직 호출
		return service.clearChatMessages();
	}
	
	@GetMapping("/main/csCustomer")
	public String csCustomer(HttpServletRequest request, Model model) {
		return service.csCustomer(request, model);
	}
	
	@GetMapping("/pickup/pickup")
	public String pickup() {
		return service.pickup();
	}
}
