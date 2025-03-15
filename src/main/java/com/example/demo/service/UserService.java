package com.example.demo.service;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface UserService {
	String user();
	String useridCheck(HttpServletRequest request);
	String userOk(UserDto udto);
	String userView(HttpSession session, Model model);
	String pwdCheck(HttpSession session, HttpServletRequest request);
	String pwdChg(HttpSession session, String oldPwd, String newPwd, Model model, RedirectAttributes redirectAttributes);
	String editEmail(HttpSession session, String email);
	String editPhone(HttpSession session, String phone);
	String reqOut(HttpSession session, Model model);
	String idDelete(String userid, String pwd, Model model);
	String recoveryid(HttpSession session, Model model);
	String recoveryReq(String userid, String pwd, Model model);
	
	
}
