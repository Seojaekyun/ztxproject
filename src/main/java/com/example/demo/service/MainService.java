package com.example.demo.service;

import java.util.List;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface MainService {
	String index(HttpServletRequest request, Model model);
	String saveMessage(String message, boolean isAdmin);
	List<String> getMessages();
	String clearChatMessages();
	String csCustomer(HttpServletRequest request, Model model);
	String pickup();
	String reservInfo();
	String trainservice();
	String theme();
	String free();
	String etiquette();
	String station();
	String info();
	String traininfo();
	String mship();
	String mshipsogae();
	String mshipcoupon();
	
	
}
