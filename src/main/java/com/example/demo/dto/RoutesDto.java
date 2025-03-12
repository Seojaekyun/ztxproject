package com.example.demo.dto;

import lombok.Data;

@Data
public class RoutesDto {
	private int routeid, seat, trainid, unitPrice, avaiSeats, charge;
	private String departure, arrival, routeTime, departureTime, arrivalTime, departure_time, arrival_time, ftime;
	
	
}
