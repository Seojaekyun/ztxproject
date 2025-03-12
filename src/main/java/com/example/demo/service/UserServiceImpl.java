package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		
		if(u == 0)
		{
			mapper.userOk(udto);
			return "redirect:/login/login";
		}
		else
		{
			return "redirect:/user/user?err=1";
		}
	}

	@Override
	public String userView(HttpSession session, Model model)
	{		
		if(session.getAttribute("userid") == null)
		{
			return "redirect:/login/login";
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			
			UserDto udto=mapper.userView(userid);
			
			model.addAttribute("udto", udto);
			
			return "/user/userView";
		}
	}

	@Override
	public String updateOk(HttpSession session, HttpServletRequest request, UserDto udto)
	{
		if(session.getAttribute("userid") == null)
		{
			return "redirect:/login/login";
		}
		else
		{	
			String userid=session.getAttribute("userid").toString();
			udto.setUserid(userid);
			
			//System.out.println(udto.getPhone());
			//System.out.println("비밀번호:"+udto.getPwd());
			if(udto.getPwd() == null)
			{
				mapper.updateOk1(udto);
			}
			else
			{
				mapper.updateOk2(udto);
			}
			
			
			return "redirect:/main/index";
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
