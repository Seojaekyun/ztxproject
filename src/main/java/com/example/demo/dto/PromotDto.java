package com.example.demo.dto;

import lombok.Data;

@Data
public class PromotDto {
	private int id, readnum;
	private String title, content, writeday, fname, subtitle;
}