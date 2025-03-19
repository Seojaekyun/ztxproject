package com.example.demo.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.dto.ReviewDto;
import com.example.demo.mapper.ReviewMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("rev")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;

	@Override
	public String list(HttpServletRequest request, Model model)
	{
		int page=1;
		if (page <= 0) page = 1;

		// 페이지 계산
		int pstart = (page / 10) * 10 + 1; // 시작 페이지
		if (page % 10 == 0) pstart -= 10; // 페이지가 10으로 나누어지면 한 페이지 앞당겨줌
		int pend = pstart + 9; // 끝 페이지

		// 전체 항목 수 가져오기 (mapper에서 전체 항목 수를 조회)
		int chong = mapper.getChong();

		// 끝 페이지가 전체 항목 수보다 크면 끝 페이지 수정
		if (pend > chong) pend = chong;

		// 해당 페이지에 맞는 데이터 가져오기
		int index = (page - 1) * 10;
		    
		ArrayList<ReviewDto> revlist=mapper.list(index);
			
		model.addAttribute("revlist", revlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("chong", chong);
			
		return "/review/list"; 
	}

	@Override
	public String readnum(HttpSession session, HttpServletRequest request)
	{
		if(session.getAttribute("userid") == null)
		{
			return  "redirect:/login/login";
		}
		else
		{
			String page=request.getParameter("page");
			String id=request.getParameter("id");
			
			mapper.readnum(id);
			
			return "redirect:/review/content?id="+id+"&page="+page;
		}
	}

	@Override
	public String content(HttpSession session, HttpServletRequest request, Model model)
	{
		if(session.getAttribute("userid") == null)
		{
			return  "redirect:/login/login";
		}
		else
		{
			String id=request.getParameter("id");
			String page=request.getParameter("page");
			
			ReviewDto revdto=mapper.content(id);
			
			revdto.setContent(revdto.getContent().replace("/r/n", "<br>"));
			
			model.addAttribute("revdto", revdto);
			model.addAttribute("page", page);
			
			return "/review/content";
		}
	}

	@Override
	public String writeOk(ReviewDto revdto, MultipartFile file, HttpSession session) throws IOException
	{
		if(session.getAttribute("userid") == null)
		{
			return  "redirect:/login/login";
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			String fname=file.getOriginalFilename();
			String imsi=ResourceUtils.getFile("classpath:static/resources/files").toPath().toString()+"/"+fname;
			
			Path path=Paths.get(imsi);
			Files.copy(file.getInputStream(), path);
			
			revdto.setUserid(userid);
			revdto.setFname(fname);
			
			mapper.writeOk(revdto);
			
			return "redirect:/review/list";
		}
	}
	
	@Override
	public String update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		ReviewDto revdto=mapper.content(id);
		
		model.addAttribute("revdto", revdto);
		model.addAttribute("page", page);
		
		return "/review/update";
	}

	@Override
	public String updateOk(HttpSession session, ReviewDto revdto, MultipartFile file) throws Exception
	{
		if(session.getAttribute("userid") == null)
		{
			return "redirect:/login/login";
		}
		else
		{
			//System.out.println("updateOk : "+file.isEmpty()+" "+file.getOriginalFilename());
			if(file.isEmpty())
			{
				mapper.updateOk1(revdto);
				
				return "redirect:/review/list";
			}
			else
			{
				String fname=file.getOriginalFilename();
				String imsi=ResourceUtils.getFile("classpath:static/resources/files").toPath().toString()+"/"+fname;
				
				Path path=Paths.get(imsi);
				Files.copy(file.getInputStream(), path);
				
				revdto.setFname(fname);
				
				mapper.updateOk2(revdto);
				
				return "redirect:/review/list";
			}
		}
	}
	
	
}
