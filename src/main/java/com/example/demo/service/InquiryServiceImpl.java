package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;
import com.example.demo.mapper.InquiryMapper;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Service
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private InquiryMapper mapper;

    @Override
    public String inquiryList(int page, HttpSession session, Model model) {
        int index = (page - 1) * 20;
        int total = mapper.getChong();
        int totalPage = (int) Math.ceil((double) total / 20);

        List<InquiryDto> inquiries = mapper.inquiryList(index);
        model.addAttribute("inquiries", inquiries);
        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage);
        return "/inquiry/inquiryList";
    }

    @Override
    public String inquiryMyList(int page, HttpSession session, Model model) {
        String userid = (session.getAttribute("userid") != null) 
                        ? session.getAttribute("userid").toString() 
                        : null; // ✅ 비회원은 null 값으로 설정 (guest가 아닌 모든 사용자 조회)

        int index = (page - 1) * 20;
        int total = (userid != null) ? mapper.getChongByUser(userid) : 0;
        int totalPage = (int) Math.ceil((double) total / 20);

        List<InquiryDto> myInquiries = (userid != null) 
                                        ? mapper.inquiryMyList(userid, index) 
                                        : new ArrayList<>(); // ✅ 비회원이면 빈 리스트 반환

        model.addAttribute("myInquiries", myInquiries);
        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage);
        return "/inquiry/inquiryMyList";
    }


    @Override
    public String inquiryWrite(HttpSession session, Model model) {
        if (session.getAttribute("userid") != null) {
            String userid = session.getAttribute("userid").toString();
            model.addAttribute("userid", userid);
        }
        return "/inquiry/inquiryWrite";
    }

    @Override
    public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model) {
        String userid = (session.getAttribute("userid") != null) 
                        ? session.getAttribute("userid").toString() 
                        : "guest";

        idto.setUserid(userid); // ✅ userid 설정 (비회원도 "guest"로 저장)

        // ✅ 모든 사용자(회원/비회원)에게 비밀번호 입력 필수
        if (idto.getPwd() == null || idto.getPwd().isEmpty()) {
            model.addAttribute("error", "비밀번호를 입력해야 합니다.");
            return "/inquiry/inquiryWrite";
        }

        mapper.inquiryWriteOk(idto);
        return "redirect:/inquiry/inquiryList";
    }



    @Override
    public String inquiryContent(int id, HttpSession session, Model model) {
        InquiryDto inquiry = mapper.readnum(id);
        model.addAttribute("inquiry", inquiry);
        return "/inquiry/inquiryContent";
    }

    @Override
    public String inquiryUpdateCheck(int id, String pwd, Model model) {
        InquiryDto inquiry = mapper.getInquiryById(id);
        if (inquiry == null || !inquiry.getPwd().equals(pwd)) {
            model.addAttribute("error", "비밀번호가 올바르지 않습니다.");
            model.addAttribute("inquiry", inquiry);
            return "inquiry/inquiryContent";
        }
        return "redirect:/inquiry/inquiryUpdate?id=" + id;
    }

    @Override
    public String inquiryDeleteCheck(int id, String pwd, Model model) {
        InquiryDto inquiry = mapper.getInquiryById(id);
        if (inquiry == null || !inquiry.getPwd().equals(pwd)) {
            model.addAttribute("error", "비밀번호가 올바르지 않습니다.");
            model.addAttribute("inquiry", inquiry);
            return "inquiry/inquiryContent";
        }
        mapper.inquiryDelete(id);
        return "redirect:/inquiry/inquiryList";
    }
}