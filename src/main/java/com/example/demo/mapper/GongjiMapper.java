package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.GongjiDto;

@Mapper
public interface GongjiMapper {
	public ArrayList<GongjiDto> list(int index);
	public int getChong();
	public void writeOk(GongjiDto gdto);
	public void readnum(String id);
	public GongjiDto content(String id);
	public void updateOk(GongjiDto gdto);
}
