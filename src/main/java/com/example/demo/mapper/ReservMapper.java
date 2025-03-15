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
	ArrayList<ReservDto> list(int index, String userid);
	int getChong(String userid);
	List<ReservDto> getRsvByDate(String selectedDate);
	List<ReservDto> getRsvanow();
	List<Map<String, Object>> getAvaiSeatCountByRouteid();
	List<ReservDto> getRsvdetail(String trainid, String routeTime, int start, int itemsPerPage);
	List<ReservDto> getRsvdfn(String trainid, String routeTime);
	int getTotalReserv(String trainid, String routeTime);
	int getSeatCountByReservid(int reservid);
	Integer getState(int reservid);
	List<String> getMonthLabels();
	List<Integer> getMonthRsv();
	List<String> getRouteLabels();
	List<Integer> getRouteRsv();
	List<Map<String, Object>> getRsvcPay(String pnr);
	List<Map<String, Object>> getReservSeatInfo(String pnr);
	void payOk(ReservDto rdto);
	void chargeOk(ReservDto rdto);
	ReservDto getMyrsv(String userid);
	List<ReservDto> getRsvUserid(String userid, int itemsPerPage, int offset);
	int getTresByUser(String userid);
	List<Map<String, Object>> getMyRsvDetail(String PNR);
	List<Map<String, Object>> getMyRsvDetailSeat(String PNR);
	void cancelOffer(ReservDto rdto);
	void cancelConfirm(String rid);
	void cancelSeat(String roid, String rid);
	void cancelRejection(String rid);
	void payReturn(String rid);
	
	
}
