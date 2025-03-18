package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	public ArrayList<ReviewDto> list(int index);
	public void readnum(String id);
	public int getChong();
	public ReviewDto content(String id);
	public void writeOk(ReviewDto revdto);
}
