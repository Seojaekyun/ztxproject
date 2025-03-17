package com.example.demo.dto;

import lombok.Data;

@Data
public class InquiryDto {

	private int id, ref, category, status, readnum, count, rank;
	private String userid, name, title, content, phone, writeday, pwd, answer;
}
