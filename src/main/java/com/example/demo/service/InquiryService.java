package com.example.demo.service;

import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;
import jakarta.servlet.http.HttpSession;

public interface InquiryService {
	public String inquiryList(int page, HttpSession session, Model model);
	public String inquiryMyList(int page, HttpSession session, Model model);
	public String inquiryWrite(HttpSession session, Model model);
	public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model);
	public String inquiryContent(int id,String inputPwd, HttpSession session, Model model);
	public String inquiryUpdateCheck(int id, String pwd, Model model);
	public String inquiryDeleteCheck(int id, String pwd, Model model);
	
}