package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.GongjiDto;

@Mapper
public interface GongjiMapper {
	List<GongjiDto> list(int index);
	int getChong();
	void writeOk(GongjiDto gdto);
	void readnum(String id);
	GongjiDto content(String id);
	void updateOk(GongjiDto gdto);
	void delete(String id);
	
	
}
