package com.example.demo.service;

import java.util.ArrayList;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.ReservDto;
import com.example.demo.mapper.ReservMapper;

import jakarta.servlet.http.HttpSession;

@Service("ress")
public class ReservServiceImpl implements ReservService {
	@Autowired
	private ReservMapper resMapper;

	@Override
	public String reservCheck(int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, String selectedSeats, Model model, HttpSession session) {
		
		String userid=(String) session.getAttribute("userid");
		String name=(String) session.getAttribute("name");
		
		model.addAttribute("userid", userid);
		model.addAttribute("name", name);
		model.addAttribute("routeDeparture", routeDeparture);
		model.addAttribute("routeArrival", routeArrival);
		model.addAttribute("routeTime", routeTime);
		model.addAttribute("routeArrivalTime", routeArrivalTime);
		model.addAttribute("resnum", resnum);
		model.addAttribute("selectedSeats", selectedSeats);
		
		return "/reserv/reservCheck";
	}
	
	private String generatePNR() {
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";  // 알파벳과 숫자
		StringBuilder pnr = new StringBuilder();
		Random rnd = new Random();
		while (pnr.length() < 6) {  // PNR 6자리
			int index = (int) (rnd.nextFloat() * chars.length());
			pnr.append(chars.charAt(index));
		}
		return pnr.toString();
	}

	@Override
	public String reservConfirm(String userid, int routeid, String routeDeparture, String routeArrival, String routeTime,
            String routeArrivalTime, int resnum, String selectedSeats, Model model, HttpSession session) {
		String PNR = generatePNR();
		String[] seatsArray = selectedSeats.split(",");
		
		// DTO 객체 생성 후 MyBatis에 전달
		ReservDto resDto = new ReservDto(userid, routeid, routeDeparture, routeArrival, routeTime,
				routeArrivalTime, resnum, PNR);
		
		try {
		    resMapper.addReserv(resDto);
		    
		}
		catch (Exception e) {
		    e.printStackTrace(); // 예외 정보 출력
		    model.addAttribute("errorMessage", "예약 처리 중 오류가 발생했습니다.");
		    return "errorPage"; // 오류 발생 시 이동할 페이지
		}
		
		// INSERT 후 생성된 예약 ID 가져오기
		int reservid = resDto.getReservid();
				
		for (String seat : seatsArray) {
			int seatid = resMapper.getSeatid(seat.trim(),routeid); // 좌석 번호를 통해 seat_id 조회
			if (seatid > 0) {
				resMapper.upTrainSeatAvai(routeid, seatid, reservid); // 좌석 가용성 업데이트
			}
			else {
				model.addAttribute("errorMessage", "잘못된 좌석 번호: " + seat);
				return "errorPage";
			}
		}
		
		resMapper.upRouteSeat(routeid, resnum);
		
		model.addAttribute("PNR", PNR);
		model.addAttribute("routeid", routeid);
		model.addAttribute("selectedSeats", selectedSeats);
		model.addAttribute("resnum", resnum);
		model.addAttribute("routeDeparture", routeDeparture);
		model.addAttribute("routeArrival", routeArrival);
		model.addAttribute("routeTime", routeTime);
		model.addAttribute("routeArrivalTime", routeArrivalTime);
		
		return "/reserv/reservConfirm";
	}

	@Override
	public String list(Model model)
	{	
		ArrayList<ReservDto> reslist=resMapper.list();
		
		model.addAttribute("reslist", reslist);
		
		return "/reserv/list";
	}
	
	
	
}
