package com.example.demo.dto;

import java.util.List;

import lombok.Data;

@Data
public class UserDto {
	private int id,state,level,previousLevel;
	private String userid,pwd,email,phone,name,writeday,oldPwd,adminid,newPwd;
	private List<ReservDto> reservlist;
	
	
}
