package com.example.demo.dto;

import java.time.LocalTime;

import lombok.Data;

@Data
public class RouteTimeDto {
	private String dep, arr;
	private LocalTime routetime;
	private int unitprice;
	
}
