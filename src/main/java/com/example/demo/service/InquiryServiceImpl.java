package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;
import com.example.demo.mapper.InquiryMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Service
@Qualifier("is")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryMapper mapper;

	@Override
	public String list(int page, HttpSession session, Model model) {
		int index = (page - 1) * 10;
		int total = mapper.getChong();
		int totalPage = (int) Math.ceil((double) total / 20);

		List<InquiryDto> inquiries = mapper.list(index);
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		return "/inquiry/list";
	}

	@Override
	public String myList(int page, HttpSession session, Model model) {
		String userid = (session.getAttribute("userid") != null
				&& !session.getAttribute("userid").toString().trim().isEmpty())
				? session.getAttribute("userid").toString().trim(): null;
		int index = Math.max((page - 1) * 10, 0);
		int total = (userid != null) ? mapper.getChongByUser(userid) : 0;
		int totalPage = (total > 0) ? (int) Math.ceil((double) total / 10) : 1;

		List<InquiryDto> myInquiries = (userid != null) ? mapper.
				myList(userid, index) : new ArrayList<>();
		
		model.addAttribute("myInquiries", myInquiries);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		
		return "/inquiry/myList";
	}
	
	@Override
	public String write(HttpSession session, Model model) {
		if(session.getAttribute("userid") != null) {
			String userid = session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			InquiryDto userInfo = mapper.getUserInfo(userid);
			model.addAttribute("userInfo", userInfo);
		}
		
		return "/inquiry/write";
	}

	@Override
	public String writeOk(InquiryDto idto, HttpSession session, Model model) {
		String userid = (session.getAttribute("userid") != null)
				? session.getAttribute("userid").toString() : "guest";
		idto.setUserid(userid);
		if(idto.getPwd() == null || idto.getPwd().isEmpty()) {
			model.addAttribute("error", "비밀번호를 입력해야 합니다.");
			return "/inquiry/write";
		}
		
		mapper.writeOk(idto);
		return "redirect:/inquiry/list";
	}
	
	@Override
	public String readnum(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.readnum(id);
		return "redirect:/inquiry/content?id=" + id;
	}

	@Override
	public String content(HttpServletRequest request, HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			model.addAttribute(userid);
		}
		String id = request.getParameter("id");
		InquiryDto idto = mapper.content(id);
		idto.setContent(idto.getContent().replace("\\r\\n", "<br>"));
		System.out.println(idto);
		model.addAttribute("idto", idto);

		return "/inquiry/content";
	}

	@Override
	public String delete(int id, String pwd, HttpSession session, Model model) {
		InquiryDto existingInquiry = mapper.getInquiryById(id);

		if (existingInquiry == null) {
			model.addAttribute("error", "존재하지 않는 문의입니다.");
			return "redirect:/inquiry/list";
		}

		String sessionUserId = (session.getAttribute("userid") != null)
				? session.getAttribute("userid").toString() : null;
		if (!"guest".equals(existingInquiry.getUserid())) {
			if (sessionUserId == null || !sessionUserId.equals(existingInquiry.getUserid())) {
				return "redirect:/login/login";
			}
		}
		else {
			if (pwd == null || !pwd.equals(existingInquiry.getPwd())) {
				model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
				return "redirect:/inquiry/content/" + id;
			}
		}

		mapper.delete(id);
		return "redirect:/inquiry/list";
	}

	@Override
	public String update(int id, Model model, HttpSession session) {
		InquiryDto inquiry = mapper.getInquiryById(id);
		if (inquiry == null) {
			model.addAttribute("error", "존재하지 않는 문의입니다.");
			return "redirect:/inquiry/inquiryList";
		}

		model.addAttribute("inquiry", inquiry);
		return "inquiry/update";
	}

	@Override
	public String updateOk(InquiryDto idto, HttpSession session, HttpServletRequest request) {
		InquiryDto existingInquiry = mapper.getInquiryById(idto.getId());
		if (existingInquiry == null) {
			request.setAttribute("error", "존재하지 않는 문의입니다.");
			return "redirect:/inquiry/list";
		}
		
		mapper.inquiryUpdate(idto);
		return "redirect:/inquiry/content?id=" + idto.getId();
	}

	@Override
	public InquiryDto getUserInfo(String userid) {
		return mapper.getUserInfo(userid);
	}
	
	@Override
	public String inquiryList(int page, Model model) {
		int index = (page - 1) * 10;
		int total = mapper.getChong();
		int totalPage = (int)Math.ceil((double) total / 10);
		
		List<InquiryDto> inquiries = mapper.list(index);
		
		System.out.println("adminInquiryList 조회된 문의 개수: " + (inquiries != null ? inquiries.size() : "null"));
		
		// 🛠 inquiries 리스트 내부 데이터를 자세히 출력
		for(InquiryDto inquiry : inquiries) {
			System.out.println("문의 ID: " + inquiry.getId() + ", 제목: " + inquiry.getTitle());
		}
		
		model.addAttribute("inquiries", inquiries);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		
		return "/admin/inquiryList";
	}

	@Override
	public String answer(int id, Model model) {
		InquiryDto inquiry = mapper.getInquiryById(id);
		if(inquiry == null) {
			return "redirect:/admin/inquiryList"; // 존재하지 않는 경우 리스트로 이동
		}
		model.addAttribute("inquiry", inquiry);
		return "/admin/inquiryAnswer"; // JSP 파일 이름과 일치해야 함
	}

	@Override
	public String answerOk(int id, String answer) {
		mapper.answerOk(id, answer, 1); // ref 값을 1(답변완료)로 변경
		return "redirect:/admin/inquiryList";
	}
	 
	@Override
	public String answerDel(int id) {
		mapper.answerDel(id, null, 0); // ref 값을 0(미답변)으로 변경
		return "redirect:/admin/inquiryList";
	}
	
	

}