package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.InquiryDto;
import java.util.List;

@Mapper
public interface InquiryMapper {
    List<InquiryDto> inquiryList(@Param("index") int index);
    List<InquiryDto> inquiryMyList(@Param("userid") String userid, @Param("index") int index);
    void inquiryWriteOk(InquiryDto idto);
    InquiryDto readnum(@Param("id") int id);
    InquiryDto getInquiryById(@Param("id") int id);
    void inquiryDelete(@Param("id") int id);
    int getChong();
    int getChongByUser(@Param("userid") String userid);
}
