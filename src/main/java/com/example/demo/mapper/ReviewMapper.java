package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	List<ReviewDto> list(int index);
	void readnum(String id);
	int getChong();
	ReviewDto content(String id);
	void writeOk(ReviewDto revdto);
	List<ReviewDto> rvlist();
	void updateOk1(ReviewDto revdto);
	void updateOk2(ReviewDto revdto);
	
	
}
