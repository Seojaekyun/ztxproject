package com.example.demo.dto;

import lombok.Data;

@Data
public class RoutesDto {
	private int routeid, seat, trainid, unitPrice, totalSeats;
	private String departure, arrival, departureTime, arrivalTime, departure_time, arrival_time, ftime;
	
	
}
