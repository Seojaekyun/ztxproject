package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;
import com.example.demo.mapper.InquiryMapper;

import jakarta.servlet.http.HttpServletRequest;
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

		String userid = (session.getAttribute("userid") != null
				&& !session.getAttribute("userid").toString().trim().isEmpty())
						? session.getAttribute("userid").toString().trim()
						: null;

		int index = Math.max((page - 1) * 10, 0);
		int total = (userid != null) ? mapper.getChongByUser(userid) : 0;
		int totalPage = (total > 0) ? (int) Math.ceil((double) total / 10) : 1;

		List<InquiryDto> myInquiries = (userid != null) ? mapper.inquiryMyList(userid, index) : new ArrayList<>();

		System.out.println("현재 세션 userid: " + session.getAttribute("userid"));
		System.out.println("조회에 사용된 userid: " + userid);
		System.out.println("조회된 문의 개수: " + (myInquiries != null ? myInquiries.size() : 0));

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
			InquiryDto userInfo = mapper.getUserInfo(userid);
			model.addAttribute("userInfo", userInfo);
		}
		
		return "/inquiry/inquiryWrite";
	}

	@Override
	public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model) {
		String userid = (session.getAttribute("userid") != null) ? session.getAttribute("userid").toString() : "guest";

		idto.setUserid(userid);

		if (idto.getPwd() == null || idto.getPwd().isEmpty()) {
			model.addAttribute("error", "비밀번호를 입력해야 합니다.");
			return "/inquiry/inquiryWrite";
		}

		mapper.inquiryWriteOk(idto);
		return "redirect:/inquiry/inquiryList";
	}

	@Override
	public String readnum(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.readnum(id);
		return "redirect:/inquiry/inquiryContent?id=" + id;
	}

	@Override
	public String inquiryContent(HttpServletRequest request, HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			model.addAttribute(userid);
		}
		String id = request.getParameter("id");
		InquiryDto idto = mapper.content(id);
		idto.setContent(idto.getContent().replace("\\r\\n", "<br>"));
		System.out.println(idto);
		model.addAttribute("idto", idto);

		return "/inquiry/inquiryContent";
	}

	@Override
	public String inquiryDelete(int id, String pwd, HttpSession session, Model model) {
		InquiryDto existingInquiry = mapper.getInquiryById(id);

		if (existingInquiry == null) {
			model.addAttribute("error", "존재하지 않는 문의입니다.");
			return "redirect:/inquiry/inquiryList";
		}

		String sessionUserId = (session.getAttribute("userid") != null) ? session.getAttribute("userid").toString()
				: null;

		if (!"guest".equals(existingInquiry.getUserid())) {
			if (sessionUserId == null || !sessionUserId.equals(existingInquiry.getUserid())) {
				return "redirect:/login/login";
			}
		} else {

			if (pwd == null || !pwd.equals(existingInquiry.getPwd())) {
				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
				return "redirect:/inquiry/detail/" + id;
			}
		}

		mapper.inquiryDelete(id);
		return "redirect:/inquiry/inquiryList";
	}

	@Override
	public String inquiryUpdate(int id, Model model, HttpSession session) {
		InquiryDto inquiry = mapper.getInquiryById(id);
		if (inquiry == null) {
			model.addAttribute("error", "존재하지 않는 문의입니다.");
			return "redirect:/inquiry/inquiryList";
		}

		model.addAttribute("inquiry", inquiry);
		return "inquiry/inquiryUpdate";
	}

	@Override
	public String inquiryUpdateOk(InquiryDto idto, HttpSession session, HttpServletRequest request) {

		InquiryDto existingInquiry = mapper.getInquiryById(idto.getId());
		if (existingInquiry == null) {
			request.setAttribute("error", "존재하지 않는 문의입니다.");
			return "redirect:/inquiry/inquiryList";
		}

		mapper.inquiryUpdate(idto);
		return "redirect:/inquiry/inquiryContent?id=" + idto.getId();
	}

	@Override
	public InquiryDto getUserInfo(String userid) {

		return mapper.getUserInfo(userid);
	}

}