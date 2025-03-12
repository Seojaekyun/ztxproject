package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;
import com.example.demo.mapper.GongjiMapper;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService{
	
	@Autowired
	private GongjiMapper mapper;

	@Override
	public String gongjiList(GongjiDto gdto, Model model)
	{	
		ArrayList<GongjiDto> glist=mapper.list();
		
		model.addAttribute("glist", glist);
		
		return "/admin/gongjiList";
	}

	@Override
	public String list(GongjiDto gdto, Model model)
	{	
		ArrayList<GongjiDto> glist=mapper.list();
		
		model.addAttribute("glist", glist);
		
		return "/gongji/list";
	}
}
