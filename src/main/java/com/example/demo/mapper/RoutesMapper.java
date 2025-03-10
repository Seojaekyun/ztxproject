package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.demo.dto.RoutesDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.dto.StationsDto;

@Mapper
public interface RoutesMapper {
	List<RoutesDto> findRoutes(String departure, String arrival, String departureDate, Integer resnum);
	List<SeatDto> getAvaiSeats(int routeid, int offset, int size);
	int getTotalSeat(int routeid);
	List<RoutesDto> getDepartureRoutes();
	List<RoutesDto> getArrivalRoutes();
	void addRoute(RoutesDto route);
	List<StationsDto> AllStations();
	
	
}
