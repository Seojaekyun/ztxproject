package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservDto {
	
	private int reservid;
	private int routeid, seatid, resnum, charge, payment, state, resid, trainid, seat, reservCount, sudan;
	private String userid, departure_time, routeDeparture, routeArrival, routeTime, routeArrivalTime, selectedSeats, seatnum, reservday, PNR, selectedDate, departure, arrival, offerday;
	
	// 예약 DTO 생성자 (선택적으로 작성 가능)
	public ReservDto(String userid, int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, int charge, String PNR) {
		this.userid = userid;
		this.routeid = routeid;
		this.routeDeparture = routeDeparture;
		this.routeArrival = routeArrival;
		this.routeTime = routeTime;
		this.routeArrivalTime = routeArrivalTime;
		this.resnum = resnum;
		this.charge = charge;
		this.PNR = PNR;
	}
	
	
}
