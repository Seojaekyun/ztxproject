package com.example.demo.service;

import java.util.List;

import org.springframework.ui.Model;

import com.example.demo.dto.StationsDto;
import com.example.demo.dto.TrainesDto;

import jakarta.servlet.http.HttpSession;

public interface RoutesService {
	String routeSearch(String departure, String arrival, String departureDate, Integer resnum, Model model);
	String resCheck(String routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, Integer resnum, String[] goingSelectedSeats, HttpSession session, Model model);
	String showSeatSelection(int routeid, int resnum, int page, int size, Model model);
	String confirmSeats(int routeid, String selectedSeats, int resnum, HttpSession session, Model model);
	List<StationsDto> getAllStations();
	List<TrainesDto> getAllTraines();
	void addRoute(String departure, String arrival, String departureTime, String arrivalTime, String ftime, int trainid,
			int unitPrice);
	void addSeatsForRoute();
	
	
}
