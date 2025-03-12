package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;

public interface GongjiService {
	String gongjiList(GongjiDto gdto, Model model);
	String list(GongjiDto gdto, Model model);
	
}
