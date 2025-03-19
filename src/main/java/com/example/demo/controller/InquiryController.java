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

	@GetMapping("/inquiry/list")
	public String list(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
		return service.list(page, session, model);
	}

	@GetMapping("/inquiry/myList")
	public String myList(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
		return service.myList(page, session, model);
	}

	@GetMapping("/inquiry/write")
	public String write(HttpSession session, Model model) {
		return service.write(session, model);
	}

	@PostMapping("/inquiry/writeOk")
	public String writeOk(InquiryDto idto, HttpSession session, Model model) {
		return service.writeOk(idto, session, model);
	}

	@GetMapping("/inquiry/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}

	@GetMapping("/inquiry/content")
	public String content(HttpServletRequest request, HttpSession session, Model model) {
		return service.content(request, session, model);
	}

	@GetMapping("/inquiry/update")
	public String update(@RequestParam int id, Model model, HttpSession session) {
		return service.update(id, model, session);
	}

	@PostMapping("/inquiry/updateOk")
	public String updateOk(InquiryDto idto, HttpSession session, HttpServletRequest request) {
		return service.updateOk(idto, session, request);
	}

	@GetMapping("/inquiry/delete")
	public String delete(@RequestParam int id, @RequestParam(required = false) String pwd,
			HttpSession session, Model model) {
		return service.delete(id, pwd, session, model);
	}
	
	
}