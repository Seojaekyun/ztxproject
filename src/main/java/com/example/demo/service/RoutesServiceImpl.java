package com.example.demo.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.RouteTimeDto;
import com.example.demo.dto.RoutesDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.dto.StationsDto;
import com.example.demo.dto.TrainesDto;
import com.example.demo.mapper.RoutesMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service("rs")
public class RoutesServiceImpl implements RoutesService {
	@Autowired
	private RoutesMapper mapper;
	public RoutesServiceImpl(JdbcTemplate jdbcTemplate) {
    }
	
	@Override
	public List<StationsDto> getAllStations() { 
		return mapper.AllStations();
	}
	
	@Override
	public String routeSearch(@RequestParam String departure, @RequestParam String arrival,
			@RequestParam(required = false) String departureDate, @RequestParam(required = false) Integer resnum,
			@RequestParam(required = false) Integer charge, HttpSession session, Model model) {
		LocalDate today = LocalDate.now();
		String userid=(String)session.getAttribute("userid");
		
		if(userid==null) {
			return "redirect:/login/login";
		}
		else {
			List<RoutesDto> departingRoutes=mapper.findRoutes(departure, arrival, departureDate, resnum);
			
			model.addAttribute("today", today);
			model.addAttribute("routes", departingRoutes);
			model.addAttribute("resnum", resnum);
			model.addAttribute("charge", charge);
			// 검색 결과를 보여줄 JSP 파일로 이동
			return "routes/search";
		}
	}
	
	@Override
	public String resCheck(@RequestParam String routeid, @RequestParam String routeDeparture,
			@RequestParam String routeArrival, @RequestParam String routeTime,
			@RequestParam String routeArrivalTime, @RequestParam Integer resnum, // 선택된 인원
			@RequestParam(required = false, defaultValue = "") String[] goingSelectedSeats,
			@RequestParam Integer charge, HttpServletRequest request, HttpSession session, Model model) {
		
		// 가는편 정보를 모델에 추가
		model.addAttribute("routeid", routeid);
		model.addAttribute("routeDeparture", routeDeparture);
		model.addAttribute("routeArrival", routeArrival);
		model.addAttribute("routeTime", routeTime);
		model.addAttribute("routeArrivalTime", routeArrivalTime);
		model.addAttribute("resnum", resnum);
		model.addAttribute("charge", charge);
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
	public int[] getRouteTime(String departure, String arrival) {
		RouteTimeDto RouteTimeDto = mapper.getRouteTime(departure, arrival);
		if(RouteTimeDto != null && RouteTimeDto.getRoutetime() != null) {
			LocalTime routeTime = RouteTimeDto.getRoutetime();
			int hours = routeTime.getHour();
			int minutes = routeTime.getMinute();
			int unitPrice=RouteTimeDto.getUnitprice();
			
			return new int[]{hours, minutes, unitPrice};
		}
		else {
			// Handle case where flight time is not found
			return new int[]{0, 0, 0};
		}
	}
	
	@Override
	public void addSeatsForRoute() {
	    // 1. routeid 가져오기
	    Integer routeid = mapper.getRouteidForAddingSeats();
	    
	    if (routeid != null) {
	        // 2. capa(좌석 수) 가져오기
	        Map<String, Object> trainData = mapper.getRouteCapa(routeid);
	        
	        if (trainData != null) {
	            int capacity = (int) trainData.get("seat");
	            
	            // 3. seates 테이블에서 좌석 정보 가져오기 (좌석 번호와 좌석 아이디)
	            List<SeatDto> seatNumbers = mapper.getSeatsForRoute(routeid);

	            // 4. 좌석 번호 리스트가 routeid에 맞게 제대로 가져왔는지 확인
	            if (seatNumbers.size() < capacity) {
	                // 좌석 개수가 부족하면, 추가적인 처리 필요 (예: 예외 처리 또는 로직 수정)
	                // 여기서는 capacity에 맞게 좌석을 가져왔다고 가정
	                System.out.println("좌석 개수 부족: seates 테이블에서 좌석을 추가로 가져와야 할 경우 처리 필요");
	            }

	            // 5. MyBatis에 routeid와 seatNumbers 전달하여 좌석 추가
	            Map<String, Object> params = new HashMap<>();
	            params.put("routeid", routeid);
	            params.put("seatNumbers", seatNumbers);

	            // 6. 좌석 추가
	            mapper.addSeatsForRoute(params);
	        }
	    }
	}

	
	
}
