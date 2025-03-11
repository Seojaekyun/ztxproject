package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.ReservDto;

@Mapper
public interface ReservMapper {
	void addReserv(ReservDto resDto);
	int getSeatid(String trim, int routeid);
	void upTrainSeatAvai(@Param("routeid") int routeid, @Param("seatid") int seatid,
			@Param("reservid") int reservid);
	void upRouteSeat(int routeid, int resnum);
	ArrayList<ReservDto> list(int index);
	int getChong();
	List<ReservDto> getRsvByDate(String selectedDate);
	List<ReservDto> getRsvanow();
	List<Map<String, Object>> getAvaiSeatCountByRouteid();
	List<ReservDto> getRsvdetail(String trainid, String routeTime, int start, int itemsPerPage);
	List<ReservDto> getRsvdfn(String trainid, String routeTime);
	int getTotalReserv(String trainid, String routeTime);
	int getSeatCountByReservid(int reservid);
	Integer getState(int reservid);
	
	
}
