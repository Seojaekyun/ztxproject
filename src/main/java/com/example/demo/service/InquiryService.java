package com.example.demo.service;

import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface InquiryService {
	String list(int page, HttpSession session, Model model);
	String myList(int page, HttpSession session, Model model);
	String write(HttpSession session, Model model);
	String writeOk(InquiryDto idto, HttpSession session, Model model);
	String update(int id, Model model,HttpSession session);
	String updateOk(InquiryDto idto,HttpSession session,HttpServletRequest request);
	String delete(int id, String pwd, HttpSession session, Model model);
	InquiryDto getUserInfo(String userid);
	String readnum(HttpServletRequest request);
	String content(HttpServletRequest request, HttpSession session, Model model);
	String inquiryList(int page, Model model);
	String answer(int id, Model model);
	String answerOk(int id, String answer);
	String answerDel(int id);
	
}