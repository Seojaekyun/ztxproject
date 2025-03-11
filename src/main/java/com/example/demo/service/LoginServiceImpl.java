package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.UserDto;
import com.example.demo.mapper.LoginMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper mapper;

	@Override
	public String login(HttpServletRequest request, Model model)
	{

		String err=request.getParameter("err");
		
		model.addAttribute("err", err);
		
		return "/login/login";
	}

	@Override
	public String loginOk(UserDto udto, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
	{
		String name=mapper.loginOk(udto);
		if(name == null)
		{
			return "redirect:/login/login?err=1";
		}
		else
		{
			session.setAttribute("userid", udto.getUserid());
			session.setAttribute("name", name);
		}
		return "redirect:/main/index";
	}
	
	@Override
	public String logout(HttpSession session)
	{	
		session.invalidate();
		
		return "redirect:/main/index";
	}

	@Override
	public String fUserid()
	{
		return "/login/fUserid";
	}
	
	@Override
	public String getUserid(UserDto udto)
	{
	    String userid = mapper.getUserid(udto);
	    
	    return userid != null ? userid : "존재하지 않는 사용자입니다.";
	}

	@Override
	public String fPassword()
	{
		return "/login/fPassword";
	}

	@Override
	public String getPwd(UserDto udto) throws Exception
	{
		String pwd=mapper.getPwd(udto);
		
		if(pwd != null)
		{
			String newPwd="";
			
			for(int i=1;i<5;i++)
			{
				int num=(int)(Math.random()*90);
				
				num=num+33;
				
				newPwd=newPwd+(char)num;
			}
			
			mapper.chgPwd(udto.getUserid(),newPwd);
			
			return "임시 비밀번호 : "+newPwd;
		}
		else
		{
			return "정보가 일치하지 않습니다";
		}
		
	}

	@Override
	public String loginAd(HttpServletRequest request, Model model) {
		String err=request.getParameter("err");
		model.addAttribute("err",err);
		return "/login/loginAd";
	}
	
	@Override
	public String loginAdmin(
			UserDto udto, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		String name = mapper.loginAdmin(udto);
		
		if (name != null) {
			// 로그인 성공 시 세션에 사용자 정보 저장
			session.setAttribute("userid", udto.getAdminid());
			session.setAttribute("name", name);
			
			// 메인 페이지로 리다이렉트
			return "redirect:/admin/index";
		}
		else {
			// 로그인 실패 시 로그인 페이지로 리다이렉트 (에러 메시지 포함)
			return "redirect:/login/loginAd?err=1";
		}
	}
	

}