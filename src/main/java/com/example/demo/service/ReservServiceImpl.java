package com.example.demo.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.ReservDto;
import com.example.demo.mapper.ReservMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service("ress")
public class ReservServiceImpl implements ReservService {
	@Autowired
	private ReservMapper resMapper;

	@Override
	public String reservCheck(int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, int charge, String selectedSeats, HttpServletRequest request, Model model, HttpSession session) {
		
		String userid=(String) session.getAttribute("userid");
		String name=(String) session.getAttribute("name");
		int charges=(Integer.parseInt(request.getParameter("charge")))*resnum;
		
		model.addAttribute("userid", userid);
		model.addAttribute("name", name);
		model.addAttribute("routeDeparture", routeDeparture);
		model.addAttribute("routeArrival", routeArrival);
		model.addAttribute("routeTime", routeTime);
		model.addAttribute("routeArrivalTime", routeArrivalTime);
		model.addAttribute("resnum", resnum);
		model.addAttribute("charge", charges);
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
            String routeArrivalTime, int resnum, int charge, String selectedSeats, Model model, HttpSession session) {
		String PNR = generatePNR();
		String[] seatsArray = selectedSeats.split(",");
		
		// DTO 객체 생성 후 MyBatis에 전달
		ReservDto resDto = new ReservDto(userid, routeid, routeDeparture, routeArrival, routeTime,
				routeArrivalTime, resnum, charge, PNR);
		
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
		model.addAttribute("charge", charge);
		model.addAttribute("routeDeparture", routeDeparture);
		model.addAttribute("routeArrival", routeArrival);
		model.addAttribute("routeTime", routeTime);
		model.addAttribute("routeArrivalTime", routeArrivalTime);
		
		return "/reserv/reservConfirm";
	}

	@Override
	public String list(HttpSession session, Model model, HttpServletRequest request) {
		String userid=(String)session.getAttribute("userid");
		
		int page=1;
		if(request.getParameter("page") != null)
			page=Integer.parseInt(request.getParameter("page"));
		
		int pstart,pend,chong;
		pstart=page/10;
		if(page%10 == 0)
			pstart=pstart-1;
		
		pstart=(pstart*10)+1;
		pend=pstart+9;
		
		chong=resMapper.getChong();
		
		if(pend > chong)
			pend=chong;
		
		int index=(page-1)*10;
		List<ReservDto> reslist=resMapper.list(index);
		
		model.addAttribute("userid", userid);
		model.addAttribute("reslist", reslist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		return "/reserv/list";
	}

	@Override
	public String payment(HttpSession session, HttpServletRequest request, Model model) {
		// URL 파라미터로 넘어온 pnr 값을 받음
		String PNR = request.getParameter("PNR");
				
		// 예약 리스트 가져오기
		List<Map<String, Object>> rsvClist;
		rsvClist = resMapper.getRsvcPay(PNR);
		List<Map<String, Object>> rsvSeatInfo;
		rsvSeatInfo = resMapper.getReservSeatInfo(PNR);
		int scount = rsvSeatInfo.size();
		
		// JSP로 데이터 전달
		model.addAttribute("rsvClist", rsvClist);
		model.addAttribute("rsvSeatInfo", rsvSeatInfo);
		model.addAttribute("scount", scount);
		//System.out.println("값:"+rsvClist);
		//System.out.println("값:"+rsvSeatInfo);
		return "/reserv/payment";
	}
	
	@Override
	public String chargeOk(ReservDto rdto) {
		resMapper.payOk(rdto);
		resMapper.chargeOk(rdto);
		return "redirect:/reserv/list";
	}

	@Override
	public String myRsvDetail(String PNR, Model model) {
		List<Map<String, Object>> rsvList = resMapper.getMyRsvDetail(PNR);
		List<Map<String, Object>> rsvSeatList = resMapper.getMyRsvDetailSeat(PNR);
		model.addAttribute("rsvList", rsvList);
		model.addAttribute("rsvSeatList", rsvSeatList);
		System.out.println(rsvList);
		System.out.println(rsvSeatList);
		
		return "/user/myRsvDetail";
	}

	@Override
	public String cancelOffer(ReservDto rdto) {
		resMapper.cancelOffer(rdto);
		return "redirect:/reserv/list";
	}
	
	
}
