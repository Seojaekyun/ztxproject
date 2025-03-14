package com.example.demo.dto;

import java.util.List;

import lombok.Data;

@Data
public class UserDto {
	private int id,state,level;
	private String userid,pwd,email,phone,name,writeday,oldPwd,adminid;
	private List<ReservDto> reservlist;
	
	
}
