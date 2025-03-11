package com.example.demo.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.RoutesDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.dto.StationsDto;
import com.example.demo.dto.TrainesDto;
import com.example.demo.mapper.RoutesMapper;

import jakarta.servlet.http.HttpSession;

@Service("rs")
public class RoutesServiceImpl implements RoutesService {
	@Autowired
	private RoutesMapper mapper;
	public RoutesServiceImpl(JdbcTemplate jdbcTemplate) {
    }
	
	private static final Logger logger = LoggerFactory.getLogger(RoutesServiceImpl.class);
	@Override
	public List<StationsDto> getAllStations() { 
		return mapper.AllStations();
	}
	
	@Override
	public String routeSearch(@RequestParam String departure, @RequestParam String arrival,
			@RequestParam(required = false) String departureDate,
			@RequestParam(required = false) Integer resnum, Model model) {
		LocalDate today = LocalDate.now();
		
		List<RoutesDto> departingRoutes=mapper.findRoutes(
				departure, arrival, departureDate, resnum);
		
		model.addAttribute("today", today);
		model.addAttribute("routes", departingRoutes);
		model.addAttribute("resnum", resnum);
		
		// 검색 결과를 보여줄 JSP 파일로 이동
		return "routes/search";
	}
	
	@Override
	public String resCheck(@RequestParam String routeid, @RequestParam String routeDeparture,
			@RequestParam String routeArrival, @RequestParam String routeTime,
			@RequestParam String routeArrivalTime, @RequestParam Integer resnum, // 선택된 인원
			@RequestParam(required = false, defaultValue = "") String[] goingSelectedSeats,
			HttpSession session, Model model) {
		
		// 가는편 정보를 모델에 추가
		model.addAttribute("routeid", routeid);
		model.addAttribute("routeDeparture", routeDeparture);
		model.addAttribute("routeArrival", routeArrival);
		model.addAttribute("routeTime", routeTime);
		model.addAttribute("routeArrivalTime", routeArrivalTime);
		model.addAttribute("resnum", resnum);
		session.setAttribute("routeid", routeid);
		model.addAttribute("goingSelectedSeats", goingSelectedSeats);
		
		return "routes/resCheck";
	}
	
	@Override
	public String showSeatSelection(int routeid, int resnum, int page, int size, Model model) {
		int offset = page * size;
		int totalseat=mapper.getTotalSeat(routeid);
		List<SeatDto> avaiSeats = mapper.getAvaiSeats(routeid, offset, size);
		
		int totalPages = (int) Math.ceil((double) totalseat / size);
		
		// 모델에 필요한 데이터 추가
		model.addAttribute("seats", avaiSeats);
		model.addAttribute("routeid", routeid);
		model.addAttribute("resnum", resnum);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", size);
		model.addAttribute("totalPages", totalPages);
		
		return "routes/seats";
	}
	
	@Override
	public String confirmSeats(@RequestParam int routeid, @RequestParam String selectedSeats,
			@RequestParam int resnum, HttpSession session, Model model) {
		String[] seatArray = selectedSeats.split(",");
		if (seatArray.length != resnum) {
			model.addAttribute("errorMessage", "선택한 좌석 수가 탑승객 수와 일치하지 않습니다.");
			return "routes/seats"; // 에러 메시지를 표시하고 좌석 선택 페이지로 돌아갑니다.
		}
		// 선택한 좌석과 탑승객 수 세션에 저장
		model.addAttribute("goingSelectedSeats", seatArray);  // 가는편 좌석 배열
		System.out.println("가는편 선택한 좌석: " + selectedSeats);
		return "redirect:/routes/resCheck?resnum=" + resnum;
	}
	
	@Override
	public void addRoute(String departure, String arrival, String departureTime, String arrivalTime, String ftime,
			int trainid, int unitPrice) {
		RoutesDto route = new RoutesDto();
		route.setDeparture(departure);
		route.setArrival(arrival);
		route.setDepartureTime(departureTime);
		route.setArrivalTime(arrivalTime);
		route.setTrainid(trainid);
		route.setFtime(ftime);
		route.setUnitPrice(unitPrice);
		
		mapper.addRoute(route);
		
	}
	
	@Override
	public List<TrainesDto> getAllTraines() {
		return mapper.AllTraines();
	}
	
	@Override
	public void addSeatsForRoute() {
		Integer routeid = mapper.getRouteiddForAddingSeats();
		
		if (routeid != null) {
			// capa 가져오기
			Map<String, Object> trainData = mapper.getRouteCapa(routeid);
			
			if (trainData != null) {
				int capacity = (int) trainData.get("capa");
				
				// 좌석 번호 리스트 생성 (1부터 capacity까지)
				List<Integer> seatNumbers = IntStream.rangeClosed(1, capacity)
						.boxed()
						.collect(Collectors.toList());
				
				// MyBatis에 flightId와 seatNumbers 전달하여 좌석 추가
				Map<String, Object> params = new HashMap<>();
				params.put("routeid", routeid);
				params.put("seatNumbers", seatNumbers);
				
				mapper.addSeatsForRoute(params);
			}
		}
	}
	
	
}
