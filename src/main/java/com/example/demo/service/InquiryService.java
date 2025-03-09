package com.example.demo.service;

import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;
import jakarta.servlet.http.HttpSession;

public interface InquiryService {
    String inquiryList(int page, HttpSession session, Model model);
    String inquiryMyList(int page, HttpSession session, Model model);
    String inquiryWrite(HttpSession session, Model model);
    String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model);
    String inquiryContent(int id, HttpSession session, Model model);
    String inquiryUpdateCheck(int id, String pwd, Model model);
    String inquiryDeleteCheck(int id, String pwd, Model model);
}