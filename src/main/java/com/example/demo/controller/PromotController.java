package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.PromotDto;
import com.example.demo.service.PromotService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PromotController {
	@Autowired
	@Qualifier("ps")
	private PromotService service;
	
	@GetMapping("/promot/list") 
	public String list(HttpServletRequest request, Model model) {
		return service.list(request, model);
	}
	
	@GetMapping("/promot/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}
	
	@GetMapping("/promot/content") 
	public String content(HttpServletRequest request, Model model) {
		return service.content(request, model);
	}
	
	@GetMapping("/admin/promotList")
	public String promotList(HttpServletRequest request, Model model) {
		return service.promotList(request, model);
	}
	
	@GetMapping("/admin/promotAdd")
	public String promotAdd() {
		return service.promotAdd();
	}
	
	@PostMapping("/admin/addPromots")
	public String addPromots(PromotDto pdto, @RequestParam MultipartFile file) throws Exception {
	    return service.addPromots(pdto, file);
	}
	
	@GetMapping("/admin/promotContent")
	public String promotContent(HttpServletRequest request, Model model) {
		return service.promotContent(request, model);
	}
	
	@GetMapping("/admin/promotUpdate")
	public String promotUpdate(HttpServletRequest request, Model model) {
	    return service.promotUpdate(request, model);
	}
	
	@PostMapping("/admin/upPromots")
	public String upPromots(HttpServletRequest request, @RequestParam MultipartFile file, PromotDto pdto) throws Exception {
	    return service.upPromots(request, file, pdto);
	}
	
	@GetMapping("/admin/delPromot")
	public String delPromot(HttpServletRequest request) {
		return service.delPromot(request);
	}

}
