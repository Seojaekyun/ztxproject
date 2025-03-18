package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	public @Select("SELECT name, phone FROM user WHERE userid = #{userid}") InquiryDto getUserInfo(
			@Param("userid") String userid);

	public @Update("UPDATE inquiry SET answer = #{answer}, ref = #{ref} WHERE id = #{id}") void updateInquiryAnswer(
			@Param("id") int id, @Param("answer") String answer, @Param("ref") int ref);

	public InquiryDto content(String id);

	public void readnum(String id);

	public List<InquiryDto> ilist();

	public List<InquiryDto> listCountsPerCategory();

}
