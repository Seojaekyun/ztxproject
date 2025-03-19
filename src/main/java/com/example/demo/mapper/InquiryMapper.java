package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.InquiryDto;
import java.util.List;

@Mapper
public interface InquiryMapper {
	List<InquiryDto> list(@Param("index") int index);
	List<InquiryDto> myList(@Param("userid") String userid, @Param("index") int index);
	void writeOk(InquiryDto idto);
	InquiryDto getInquiryById(@Param("id") int id);
	void delete(@Param("id") int id);
	int getChong();
	int getChongByUser(@Param("userid") String userid);
	void inquiryUpdate(InquiryDto idto);
	InquiryDto getUserInfo(String userid);
	InquiryDto content(String id);
	void readnum(String id);
	List<InquiryDto> ilist();
	List<InquiryDto> listCountsPerCategory();
	void answerOk(int id, String answer, int i);
	void answerDel(int id, String answer, int i);
	
	
}
