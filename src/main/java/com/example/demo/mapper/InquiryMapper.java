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
	public InquiryDto readnum(@Param("id") int id);
	public InquiryDto getInquiryById(@Param("id") int id);
	public void inquiryDelete(@Param("id") int id);
	public int getChong();
	public int getChongByUser(@Param("userid") String userid);
}
