package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.dto.InquiryDto;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService service;

	@GetMapping("/inquiry/inquiryList")
	public String inquiryList(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
		return service.inquiryList(page, session, model);
	}

	@GetMapping("/inquiry/inquiryMyList")
	public String inquiryMyList(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
		return service.inquiryMyList(page, session, model);
	}

	@GetMapping("/inquiry/inquiryWrite")
	public String inquiryWrite(HttpSession session, Model model) {
		return service.inquiryWrite(session, model);
	}

	@PostMapping("/inquiry/inquiryWriteOk")
	public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model) {
		return service.inquiryWriteOk(idto, session, model);
	}

	@GetMapping("/inquiry/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}

	@GetMapping("/inquiry/inquiryContent")
	public String inquiryContent(HttpServletRequest request, HttpSession session, Model model) {
		return service.inquiryContent(request, session, model);
	}

	@GetMapping("/inquiry/inquiryUpdate")
	public String inquiryUpdate(@RequestParam int id, Model model, HttpSession session) {
		return service.inquiryUpdate(id, model, session);
	}

	@PostMapping("/inquiry/inquiryUpdateOk")
	public String inquiryUpdateCheckOk(InquiryDto idto, HttpSession session, HttpServletRequest request) {
		return service.inquiryUpdateOk(idto, session, request);
	}

	@GetMapping("/inquiry/inquiryDelete")
	public String inquiryDelete(@RequestParam int id, @RequestParam(required = false) String pwd, HttpSession session,
			Model model) {
		return service.inquiryDelete(id, pwd, session, model);
	}

}