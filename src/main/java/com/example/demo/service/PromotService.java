package com.example.demo.service;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.PromotDto;

import jakarta.servlet.http.HttpServletRequest;

public interface PromotService {
	String list(HttpServletRequest request, Model model);
	String promotList(HttpServletRequest request, Model model);
	String readnum(HttpServletRequest request);
	String content(HttpServletRequest request, Model model);
	String promotContent(HttpServletRequest request, Model model);
	String promotAdd();
	String addPromots(PromotDto pdto, MultipartFile file) throws Exception;
	String promotUpdate(HttpServletRequest request, Model model);
	String upPromots(HttpServletRequest request, @RequestParam MultipartFile file, PromotDto pdto) throws Exception;
	String delPromot(HttpServletRequest request);

}
