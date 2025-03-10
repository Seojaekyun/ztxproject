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
        int index = (page - 1) * 10;
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
        // ✅ userid가 null 또는 빈 문자열("")이 아닐 때만 사용하도록 보정
        String userid = (session.getAttribute("userid") != null && !session.getAttribute("userid").toString().trim().isEmpty()) 
                        ? session.getAttribute("userid").toString().trim() 
                        : null;

        int index = Math.max((page - 1) * 10, 0); // ✅ index가 음수가 되지 않도록 보정
        int total = (userid != null) ? mapper.getChongByUser(userid) : 0;
        int totalPage = (total > 0) ? (int) Math.ceil((double) total / 10) : 1;

        List<InquiryDto> myInquiries = (userid != null) 
                                        ? mapper.inquiryMyList(userid, index) 
                                        : new ArrayList<>(); // ✅ 비회원이면 빈 리스트 반환

        // ✅ 로그 추가 (디버깅용)
        System.out.println("현재 세션 userid: " + session.getAttribute("userid"));
        System.out.println("조회에 사용된 userid: " + userid);
        System.out.println("조회된 문의 개수: " + (myInquiries != null ? myInquiries.size() : 0));

        model.addAttribute("myInquiries", myInquiries);
        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage);
        return "inquiry/inquiryMyList";
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

        idto.setUserid(userid); 

        
        if (idto.getPwd() == null || idto.getPwd().isEmpty()) {
            model.addAttribute("error", "비밀번호를 입력해야 합니다.");
            return "/inquiry/inquiryWrite";
        }

        mapper.inquiryWriteOk(idto);
        return "redirect:/inquiry/inquiryList";
    }



    @Override
    public String inquiryContent(int id, String inputPwd, HttpSession session, Model model) {
        InquiryDto inquiry = mapper.readnum(id);
        String sessionUserId = (session.getAttribute("userid") != null) 
                               ? session.getAttribute("userid").toString() 
                               : null;

        if (inquiry == null) {
            model.addAttribute("error", "존재하지 않는 문의입니다.");
            return "redirect:/inquiry/inquiryList";
        }

        // ✅ 비회원이 작성한 문의는 비밀번호 확인 후 조회 가능하도록 수정
        if ("guest".equals(inquiry.getUserid())) {
            if (inputPwd == null || inquiry.getPwd() == null || !inputPwd.trim().equals(inquiry.getPwd().trim())) {
                model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
                return "redirect:/inquiry/inquiryList";
            }
        }

        // ✅ 회원이 작성한 문의인데 본인이 아니면 로그인 페이지로 이동
        if (!"guest".equals(inquiry.getUserid()) && (sessionUserId == null || !sessionUserId.equals(inquiry.getUserid()))) {
            return "redirect:/login/login";
        }

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