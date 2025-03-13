package com.example.demo.service;

import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface InquiryService {
	public String inquiryList(int page, HttpSession session, Model model);
	public String inquiryMyList(int page, HttpSession session, Model model);
	public String inquiryWrite(HttpSession session, Model model);
	public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model);
	public String inquiryUpdate(int id, Model model,HttpSession session);
	public String inquiryUpdateOk(InquiryDto idto,HttpSession session,HttpServletRequest request);
	public String inquiryDelete(int id, String pwd, HttpSession session, Model model);
	public InquiryDto getUserInfo(String userid);
	public String readnum(HttpServletRequest request);
	public String inquiryContent(HttpServletRequest request, HttpSession session, Model model);
	
}