package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.dto.InquiryDto;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {

    @Autowired
    private InquiryService service;

    @GetMapping("/inquiry/inquiryList")
    public String inquiryList(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
        return service.inquiryList(page, session, model);
    }

    @GetMapping("/inquiry/inquiryMyList")
    public String inquiryMyList(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
        return service.inquiryMyList(page, session, model);
    }

    @GetMapping("/inquiry/inquiryWrite")
    public String inquiryWrite(HttpSession session, Model model) {
        String userid = (String) session.getAttribute("userid");

        if (userid != null) {
            // ✅ 회원 정보 조회 후 model에 저장
            InquiryDto userInfo = service.getUserInfo(userid);
            model.addAttribute("userInfo", userInfo);
        }

        return "/inquiry/inquiryWrite";
    }
    
    @PostMapping("/inquiry/inquiryWriteOk")
    public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model) {
    	return service.inquiryWriteOk(idto, session, model);
    }
    
    @RequestMapping(value = "/inquiry/detail/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public String inquiryContent(@PathVariable int id, @RequestParam(value = "pwd", required = false) String inputPwd,
    		HttpSession session, Model model) {
        return service.inquiryContent(id, inputPwd, session, model);
    }
    
    @GetMapping("/inquiry/inquiryUpdate")
    public String inquiryUpdate(@RequestParam int id, Model model , HttpSession session) {
    	return service.inquiryUpdate(id,model,session);
    } 
    
    @PostMapping("/inquiry/inquiryUpdateOk")
    public String inquiryUpdateCheckOk(InquiryDto idto,HttpSession session,HttpServletRequest request) {
        return service.inquiryUpdateOk(idto,session,request);
    }

    @GetMapping("/inquiry/inquiryDelete")
    public String inquiryDelete(@RequestParam int id,  @RequestParam(required = false) String pwd,
    		HttpSession session, Model model) {
        return service.inquiryDelete(id, pwd, session, model);
    }

    
    
}