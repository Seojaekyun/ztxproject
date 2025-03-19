package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;
import com.example.demo.mapper.GongjiMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService{
	
	@Autowired
	private GongjiMapper mapper;

	@Override
	public String gongjiList(GongjiDto gdto, Model model, HttpServletRequest request) {	
		int page=1;
		if(request.getParameter("page") != null)
			page=Integer.parseInt(request.getParameter("page"));
		
		int pstart,pend,chong; 
		pstart=page/10;
		if(page%10 == 0)
			pstart=pstart-1;
		
		pstart=(pstart*10)+1;
		pend=pstart+9;
		
		chong=mapper.getChong();
		
		if(pend > chong)
			pend=chong;
		
		int index=(page-1)*10;
		List<GongjiDto> glist=mapper.list(index);
		
		model.addAttribute("glist", glist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		return "/admin/gongjiList";
	}

	@Override
	public String list(GongjiDto gdto, Model model, HttpServletRequest request) {	
		int page=1;
		if(request.getParameter("page") != null)
			page=Integer.parseInt(request.getParameter("page"));
		
		int pstart,pend,chong;
		pstart=page/10;
		if(page%10 == 0)
			pstart=pstart-1;
		
		pstart=(pstart*10)+1;
		pend=pstart+9;
		
		chong=mapper.getChong();
		
		if(pend > chong)
			pend=chong;
		
		int index=(page-1)*10;
		List<GongjiDto> glist=mapper.list(index);
		
		model.addAttribute("glist", glist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		return "/gongji/list";
	}

	@Override
	public String gongjiWrite() {
		return "/admin/gongjiWrite";
	}

	@Override
	public String gongjiWriteOk(GongjiDto gdto) {
		mapper.writeOk(gdto);
		return "redirect:/admin/gongjiList";
	}

	@Override
	public String gongjiContent(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		GongjiDto gdto=mapper.content(id);
		
		gdto.setContent(gdto.getContent().replace("\r\n", "<br>"));
		
		model.addAttribute("gdto", gdto);
		model.addAttribute("page", page);
		
		return "/admin/gongjiContent";
	}
	
	@Override
	public String readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		mapper.readnum(id);
		
		return "redirect:/gongji/content?id="+id+"&page="+page;
	}

	@Override
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		GongjiDto gdto=mapper.content(id);
		
		gdto.setContent(gdto.getContent().replace("/r/n", "<br>"));
		
		model.addAttribute("gdto", gdto);
		model.addAttribute("page", page);
			
		return "/gongji/content";
	}

	@Override
	public String gongjiUpdate(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		GongjiDto gdto=mapper.content(id);
		
		model.addAttribute("gdto", gdto);
		model.addAttribute("page", page);
		
		return "/admin/gongjiUpdate";
	}

	@Override
	public String gongjiUpdateOk(HttpServletRequest request, GongjiDto gdto) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		mapper.updateOk(gdto);
		
		return "redirect:/admin/gongjiContent?id="+id+"&page="+page;
	}

	@Override
	public String gongjiDelete(HttpServletRequest request) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		mapper.delete(id);
		
		return "redirect:/admin/gongjiList?page="+page;
	}
	
	
}
