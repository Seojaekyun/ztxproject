package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;

import jakarta.servlet.http.HttpServletRequest;

public interface GongjiService {
	String gongjiList(GongjiDto gdto, Model model, HttpServletRequest request);
	String list(GongjiDto gdto, Model model, HttpServletRequest request);
	String gongjiWrite();
	String gongjiWriteOk(GongjiDto gdto);
	String gongjiContent(HttpServletRequest request, Model model);
	
}
