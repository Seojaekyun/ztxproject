package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserDto;

@Mapper
public interface UserMapper {
	public Integer useridCheck(String userid);
	public void userOk(UserDto udto);
	public UserDto userView(String userid);
	public void updateOk1(UserDto udto);
	public void updateOk2(UserDto udto);
	public String pwdCheck(String userid);
}
