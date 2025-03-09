package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.dto.InquiryDto;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

    @Autowired
    private InquiryService service;

    @GetMapping("/inquiryList")
    public String inquiryList(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
        return service.inquiryList(page, session, model);
    }

    @GetMapping("/inquiryMyList")
    public String inquiryMyList(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
        return service.inquiryMyList(page, session, model);
    }

    @GetMapping("/inquiryWrite")
    public String inquiryWrite(HttpSession session, Model model) {
        return service.inquiryWrite(session, model);
    }

    @PostMapping("/inquiryWriteOk")
    public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model) {
        return service.inquiryWriteOk(idto, session, model);
    }

    @GetMapping("/detail/{id}")
    public String inquiryContent(@PathVariable("id") int id, HttpSession session, Model model) {
        return service.inquiryContent(id, session, model);
    }

    @PostMapping("/inquiryUpdateCheck")
    public String inquiryUpdateCheck(@RequestParam("id") int id, @RequestParam("pwd") String pwd, Model model) {
        return service.inquiryUpdateCheck(id, pwd, model);
    }

    @PostMapping("/inquiryDeleteCheck")
    public String inquiryDeleteCheck(@RequestParam("id") int id, @RequestParam("pwd") String pwd, Model model) {
        return service.inquiryDeleteCheck(id, pwd, model);
    }
}