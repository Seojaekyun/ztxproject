package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.UserDto;
import com.example.demo.mapper.UserMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("us")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public String user() {
		return "/user/user";
	}
	
	@Override
	public String useridCheck(HttpServletRequest request) {
		String userid=request.getParameter("userid");
		return mapper.useridCheck(userid).toString();
	}

	@Override
	public String userOk(UserDto udto) {
		Integer u=mapper.useridCheck(udto.getUserid());
		if(u == 0) {
			mapper.userOk(udto);
			return "redirect:/login/login";
		}
		else {
			return "redirect:/user/user?err=1";
		}
	}

	@Override
	public String userView(HttpSession session, Model model) {
		if(session.getAttribute("userid") == null) {
			return "redirect:/login/login";
		}
		else {
			String userid=session.getAttribute("userid").toString();
			UserDto udto=mapper.userView(userid);
			model.addAttribute("udto", udto);
			
			return "/user/userView";
		}
	}
	
	@Override
	public String pwdChg(HttpSession session, @RequestParam String oldPwd, @RequestParam String newPwd,
			Model model, RedirectAttributes redirectAttributes) {
		String userid = (String) session.getAttribute("userid");
		String currentPwd = mapper.getPwdByUserid(userid);
		
		// 기존 비밀번호 검증
		if (currentPwd == null || !currentPwd.equals(oldPwd)) {
			redirectAttributes.addFlashAttribute("message", "기존 비밀번호가 일치하지 않습니다.");
			return "redirect:/user/userView";
		}
		// 비밀번호 변경
		mapper.pwdChg(userid, newPwd);
		redirectAttributes.addFlashAttribute("message", "새 비밀번호로 변경이 완료되었습니다.");
		
		return "redirect:/user/userView";
	}

	@Override
	public String editEmail(HttpSession session, @RequestParam String email) {
		String userid = (String) session.getAttribute("userid");
		mapper.editEmail(userid, email);
		return "redirect:/user/userView";
	}
	
	@Override
	public String editPhone(HttpSession session, @RequestParam String phone) {
		String userid = (String) session.getAttribute("userid");
		mapper.editPhone(userid, phone);
		return "redirect:/user/userView";
	}
	
	@Override
	public String reqOut(HttpSession session, Model model) {
		String loggedInUser = (String) session.getAttribute("loggedInUser");
		model.addAttribute("userid", loggedInUser);
		return "/user/reqOut";
	}
	
	@Override
	public String idDelete(@RequestParam String userid, @RequestParam String pwd, Model model) {
	    // 비밀번호 확인 및 탈퇴 처리
	    boolean isPwdCorrect = mapper.getPwdByUserid(userid).equals(pwd);

	    if (isPwdCorrect) {
	        // 현재 회원의 level을 가져옴
	        int currentLevel = mapper.getCurrentLevel(userid);
	        System.out.println("Updating previous_level for user: " + userid + " with level: " + currentLevel);
	        mapper.updatePreviousLevel(userid, currentLevel);  // previous_level 업데이트
	        mapper.updateUserLevel(userid, 3);  // level을 3으로 업데이트 (탈퇴 신청)

	        // 팝업과 함께 페이지 리다이렉트
	        model.addAttribute("popupMessage", "탈퇴 신청이 완료되었습니다.");
	        return "redirect:/user/userView";  // 탈퇴 후 memberView로 리다이렉트
	    } else {
	        // 비밀번호 오류 시 처리 로직
	        model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
	        return "/user/reqOut";  // 다시 비밀번호 확인 페이지로 돌아감
	    }
	}
	
	@Override
	public String recoveryid(HttpSession session, Model model) {
		String loggedInUser = (String) session.getAttribute("loggedInUser");
		model.addAttribute("userid", loggedInUser);
		return "/user/recoveryid";
	}
	
	@Override
	public String recoveryReq(@RequestParam String userid, @RequestParam String pwd, Model model) {
		// 비밀번호 확인 로직 수행
		boolean isPwdCorrect = mapper.checkPwd(userid, pwd);
		if (isPwdCorrect) {
			mapper.updateUserLevel(userid, 5);
			// 팝업과 함께 페이지 리다이렉트
			model.addAttribute("popupMessage", "복구 신청이 완료되었습니다.");
			return "redirect:/user/userView";  // 확인 후 memberView로 리다이렉트
		}
		else {
			// 비밀번호 오류 시 처리 로직
			model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "/user/recoveryid";  // 다시 비밀번호 확인 페이지로 돌아감
		}
	}

	@Override
	public String pwdCheck(HttpSession session, HttpServletRequest request)
	{
		String userid=session.getAttribute("userid").toString();
		String oPwd=request.getParameter("oPwd");
		String pwd=mapper.pwdCheck(userid);
		
		if(!oPwd.equals(pwd))
		{
			return "0";
		}
		else
		{
			return "1";
		}

	}
	
	
}
