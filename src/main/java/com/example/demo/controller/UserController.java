package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.UserDto;
import com.example.demo.service.ReservService;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	@Qualifier("us")
	private UserService service;
	
	@Autowired
	@Qualifier("ress")
	private ReservService rservice;
	
	@GetMapping("/user/user")
	public String user() {
		return service.user();
	}
	
	@GetMapping("/user/useridCheck")
	public @ResponseBody String useridCheck(HttpServletRequest request) {
		return service.useridCheck(request);
	}
	
	@PostMapping("/user/userOk")
	public String userOk(UserDto udto) {
		return service.userOk(udto);
	}
	
	@GetMapping("/user/userView")
	public String userView(HttpSession session, Model model) {
		return service.userView(session, model);
	}
	
	@PostMapping("/user/pwdChg")
	public String pwdChg(HttpSession session, @RequestParam String oldPwd, @RequestParam String pwd, Model model, RedirectAttributes redirectAttributes) {
		return service.pwdChg(session, oldPwd, pwd, model, redirectAttributes);
	}
	
	@PostMapping("/user/emailEdit")
	public String editEmail(HttpSession session, @RequestParam String email) {
		return service.editEmail(session, email);
	}
	
	@PostMapping("/user/phoneEdit")
	public String editPhone(HttpSession session, @RequestParam String phone) {
		return service.editPhone(session, phone);
	}
	
	@GetMapping("/user/pwdCheck")
	public @ResponseBody String pwdCk(HttpSession session, HttpServletRequest request) {
		return service.pwdCheck(session, request);
	}
	
	@GetMapping("/user/reqOut")
	public String reqOut(HttpSession session, Model model) {
		return service.reqOut(session, model);
	}
	
	@PostMapping("/user/id_delete")
	public String idDelete(@RequestParam String userid, @RequestParam String pwd, Model model) {
		return service.idDelete(userid, pwd, model);
	}
	
	@GetMapping("/user/recoveryid")
	public String recoveryid(HttpSession session, Model model) {
		return service.recoveryid(session, model);
	}
	
	@PostMapping("/user/recoveryReq")
	public String recoveryReq(@RequestParam String userid, @RequestParam String pwd, Model model) {
		return service.recoveryReq(userid, pwd, model);
	}
	
	@GetMapping("/user/myRsvDetail")
	public String myRsvDetail(@RequestParam String PNR, Model model) {
        return rservice.myRsvDetail(PNR, model);
    }
	
	
}
