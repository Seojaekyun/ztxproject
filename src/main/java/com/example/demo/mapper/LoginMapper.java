package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.UserDto;

@Mapper
public interface LoginMapper {
	String loginOk(UserDto udto);
	String getUserid(UserDto udto);
	String getPwd(UserDto udto);
	int chgPwd(@Param("userid") String userid, @Param("pwd") String newPwd);
	String loginAdmin(UserDto udto);
}
