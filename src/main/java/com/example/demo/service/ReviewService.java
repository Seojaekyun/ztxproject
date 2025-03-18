package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ReviewService {
	String list(HttpServletRequest request, Model model, HttpSession session);

}
