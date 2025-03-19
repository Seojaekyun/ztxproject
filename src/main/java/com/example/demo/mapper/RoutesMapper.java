package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.RouteTimeDto;
import com.example.demo.dto.RoutesDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.dto.StationsDto;
import com.example.demo.dto.TrainesDto;

@Mapper
public interface RoutesMapper {
	List<RoutesDto> findRoutes(String departure, String arrival, String departureDate, Integer resnum);
	List<SeatDto> getAvaiSeats(int routeid, int offset, int size);
	int getTotalSeat(int routeid);
	List<RoutesDto> getDepartureRoutes();
	List<RoutesDto> getArrivalRoutes();
	void addRoute(RoutesDto route);
	List<StationsDto> getAllStations();
	List<RoutesDto> getRoutesByDate(String selectedDate);
	List<RoutesDto> getAllRoutes();
	List<Map<String, Object>> getTotalSeatsByRouteid();
	List<TrainesDto> getAllTraines();
	Integer getRouteidForAddingSeats();
	Map<String, Object> getRouteCapa(Integer routeid);
	void addSeats(Map<String, Object> params);
	RouteTimeDto getRouteTime(@Param("a") String a, @Param("b") String b);
	List<SeatDto> getSeatsForRoute(Integer routeid);
	void addRoutes(String departure, String arrival, String departureTime, String arrivalTime, String ftime, int trainid,
			int unitPrice);
	void addSeats();
	List<RoutesDto> getRoutes(int offset, int itemsPerPage);
	int countRoutes();
	List<RoutesDto> getAvaiRoutes();
	List<String> getDepByDate(String date);
	List<String> getArrivalByDepAndDate(String departure, String date);
	
	
}
