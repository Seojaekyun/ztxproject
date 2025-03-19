package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.InquiryDto;
import java.util.List;

@Mapper
public interface InquiryMapper {
	public List<InquiryDto> inquiryList(@Param("index") int index);
	public List<InquiryDto> inquiryMyList(@Param("userid") String userid, @Param("index") int index);
	public void inquiryWriteOk(InquiryDto idto);
	public InquiryDto getInquiryById(@Param("id") int id);
	public void inquiryDelete(@Param("id") int id);
	public int getChong();
	public int getChongByUser(@Param("userid") String userid);
	public void inquiryUpdate(InquiryDto idto);
	public InquiryDto getUserInfo(String userid);
	public InquiryDto content(String id);
	public void readnum(String id);
	public List<InquiryDto> ilist();
	public List<InquiryDto> listCountsPerCategory();
	public void answerOk(int id, String answer, int i);
	public void answerDel(int id, String answer, int i);
	
	
	
}
