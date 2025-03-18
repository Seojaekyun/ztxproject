package com.example.demo.service;

import java.io.IOException;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ReviewService {
	String list(HttpServletRequest request, Model model, HttpSession session);
	String readnum(HttpSession session, HttpServletRequest request);
	String content(HttpSession session, HttpServletRequest request, Model model);
	String writeOk(ReviewDto revdto, MultipartFile file, HttpSession session) throws IOException;

}
