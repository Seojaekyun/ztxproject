package com.example.demo.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.ReservDto;
import com.example.demo.dto.RoutesDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.dto.StationsDto;
import com.example.demo.dto.TrainesDto;
import com.example.demo.dto.UserDto;
import com.example.demo.mapper.InquiryMapper;
import com.example.demo.mapper.ReservMapper;
import com.example.demo.mapper.RoutesMapper;
import com.example.demo.mapper.UserMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private ReservMapper rmapper;
	
	@Autowired
	private RoutesMapper romapper;
	
	@Autowired
	private InquiryMapper imapper;
	
	@Autowired
	private UserMapper umapper;

	@Override
	public String adminIndex(HttpSession session, HttpServletRequest request, Model model) {
		Object useridObj = session.getAttribute("userid");
		
		if(useridObj == null) {
			return "redirect:/main/index";  // userid가 null이면 메인 페이지로 리다이렉트
		}
		
		String adminid = useridObj.toString();
		
		if("administrator".equals(adminid)) {
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			
			List<RoutesDto> departureList = romapper.getDepartureRoutes();
			List<RoutesDto> arrivalList = romapper.getArrivalRoutes();
			
			model.addAttribute("departureList", departureList);
			model.addAttribute("arrivalList", arrivalList);
			
			List<InquiryDto> ilist = imapper.ilist();
			model.addAttribute("ilist", ilist);
			
			List<InquiryDto> countsList = imapper.listCountsPerCategory();
			countsList.sort((entry1, entry2) -> 
			Integer.compare(entry2.getCount(), entry1.getCount()));
			
			for(int i = 0; i < countsList.size(); i++) {
				countsList.get(i).setRank(i + 1);  // 1위부터 순위 부여
			}
			
			model.addAttribute("countsList", countsList);
			
			List<ReservDto> rsvList = rmapper.getRsvanow().stream().filter(rsv -> {
				LocalDateTime departure_time = LocalDateTime.parse(rsv.getRouteTime(), formatter);
				return departure_time.isAfter(now);  // 현재 시간 이후인지 확인
			}).collect(Collectors.toList());
			
			List<ReservDto> seoulRsv = rsvList.stream().filter(rsv -> rsv.getDeparture()
					.equals("서울역")).limit(5).collect(Collectors.toList());
			model.addAttribute("seoulRsv", seoulRsv);
			
			List<ReservDto> pusanRsv = rsvList.stream().filter(rsv -> rsv.getDeparture()
					.equals("부산역")).limit(5).collect(Collectors.toList());
			model.addAttribute("pusanRsv", pusanRsv);
			
			List<ReservDto> otherRsv = rsvList.stream().filter(rsv -> !rsv.getDeparture()
					.equals("서울역") && !rsv.getDeparture().equals("부산역"))
					.limit(5).collect(Collectors.toList());
			model.addAttribute("otherRsv", otherRsv);
			
			return "/admin/index";
		}
		else {
			return "redirect:/main/index";
		}
	}
	
	@Override
	public String reservList(String selectedDate, Integer seoulPage, Integer pusanPage, Integer otherPage, Integer page,
			Model model) {
		int itemsPerPage = 5; // 페이지당 항목 수
		
		// 페이지 번호가 null이거나 1보다 작으면 기본값으로 설정
		if(page == null || page < 1) {
			page = 1;
		}
		if(seoulPage == null || seoulPage < 1) {
			seoulPage = 1;
		}
		if(pusanPage == null || pusanPage < 1) {
			pusanPage = 1;
		}
		if(otherPage == null || otherPage < 1) {
			otherPage = 1;
		}
		
		// 선택한 날짜가 있을 경우 해당 날짜에 맞는 예약 데이터만 가져오기
		List<ReservDto> rsvList;
		if(selectedDate != null && !selectedDate.isEmpty()) {
			rsvList = rmapper.getRsvByDate(selectedDate);  // 특정 날짜의 예약 내역 가져오기
		}
		else {
			rsvList = rmapper.getRsvanow();  // 선택한 날짜가 없으면 현재 이후 예약 내역 가져오기
		}
		
		// 전체 예약 내역에 대한 페이징 처리
		int totalItems = rsvList.size();
		List<ReservDto> pagedRsvList = paginateList(rsvList, page, itemsPerPage);
		int totalPages = calculateTotalPages(totalItems, itemsPerPage);
		model.addAttribute("rsvList", pagedRsvList);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		
		// seoul, pusan, 기타 출발 항공편 필터링 및 페이징 처리
		List<ReservDto> seoulList = rsvList.stream().filter(rsv -> rsv.getDeparture().equals("서울역")).collect(Collectors.toList());;
		
		int seoulTotalItems = seoulList.size();
		List<ReservDto> seoulRsv = paginateList(seoulList, seoulPage, itemsPerPage);
		int seoulTotalPages = calculateTotalPages(seoulTotalItems, itemsPerPage);
		model.addAttribute("seoulRsv", seoulRsv);
		model.addAttribute("seoulTotalPages", seoulTotalPages);
		model.addAttribute("seoulCurrentPage", seoulPage);
		
		List<ReservDto> pusanList = rsvList.stream().filter(rsv -> rsv.getDeparture().equals("부산역")).collect(Collectors.toList());
		int pusanTotalItems = pusanList.size();
		List<ReservDto> pusanRsv = paginateList(pusanList, pusanPage, itemsPerPage);
		int pusanTotalPages = calculateTotalPages(pusanTotalItems, itemsPerPage);
		model.addAttribute("pusanRsv", pusanRsv);
		model.addAttribute("pusanTotalPages", pusanTotalPages);
		model.addAttribute("pusanCurrentPage", pusanPage);
		
		List<ReservDto> otherList = rsvList.stream().filter(rsv -> !rsv.getDeparture().equals("서울역") && !rsv.getDeparture().equals("부산역")).collect(Collectors.toList());
		int otherTotalItems = otherList.size();
		List<ReservDto> otherRsv = paginateList(otherList, otherPage, itemsPerPage);
		int otherTotalPages = calculateTotalPages(otherTotalItems, itemsPerPage);
		model.addAttribute("otherRsv", otherRsv);
		model.addAttribute("otherTotalPages", otherTotalPages);
		model.addAttribute("otherCurrentPage", otherPage);
		
		// 좌석 수 정보를 추가로 가져오기
		List<Map<String, Object>> availableSeatsList = rmapper.getAvaiSeatCountByRouteid();
		Map<Integer, Integer> availableSeatsMap = new HashMap<>();
		for(Map<String, Object> availableSeat : availableSeatsList) {
			availableSeatsMap.put((Integer) availableSeat.get("flight_id"), ((Long) availableSeat.get("availableSeats")).intValue());
		}
		model.addAttribute("availableSeatsMap", availableSeatsMap);
		model.addAttribute("selectedDate", selectedDate);
		
		for(ReservDto rsv : seoulList) {
			System.out.println(rsv.getDeparture()); // 이제 rsv를 이렇게 사용
		}
		
		return "/admin/reservList";
	}
	
	private List<ReservDto> paginateList(List<ReservDto> list, Integer page, int itemsPerPage) {
		int startIndex = (page - 1) * itemsPerPage;
		int endIndex = Math.min(startIndex + itemsPerPage, list.size());
		return (startIndex >= list.size()) ? Collections.emptyList() : list.subList(startIndex, endIndex);
	}
	
	private int calculateTotalPages(int totalItems, int itemsPerPage) {
		return (int) Math.ceil((double) totalItems / itemsPerPage);
	}
	
	@Override
	public String rsvdList(HttpServletRequest request, Model model) {
		String trainid = request.getParameter("trainid");
		String routeTime = request.getParameter("routeTime");
		
		// 페이지 처리 관련 변수
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		int itemsPerPage = 10;  // 한 페이지에 표시할 항목 수
		int start = (currentPage - 1) * itemsPerPage;
		
		// 필터링된 예약 리스트 가져오기
		List<ReservDto> rsvList = rmapper.getRsvdetail(trainid, routeTime, start, itemsPerPage);
		List<ReservDto> rsvfn = rmapper.getRsvdfn(trainid, routeTime);
				
		// 필터링된 데이터에 맞는 총 예약 수 가져오기
		int totalReserv = rmapper.getTotalReserv(trainid, routeTime);
		int totalPages = (int) Math.ceil((double) totalReserv / itemsPerPage);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		// 각 예약번호별 좌석 수 계산 및 offerDay -1일 처리
		Map<Integer, Integer> seatCounts = new HashMap<>();
		for(ReservDto reserv : rsvList) {
			int seatCount = rmapper.getSeatCountByReservid(reserv.getReservid());
			seatCounts.put(reserv.getReservid(), seatCount);
			
			// offerDay +1일 처리
			String offerDay = reserv.getOfferday();
			if(offerDay != null) {
				LocalDate parsedDate = LocalDate.parse(offerDay, formatter);
				LocalDate adjustedDate = parsedDate.plusDays(1); // +1일 처리
				reserv.setOfferday(adjustedDate.format(formatter)); // 다시 저장
			}
		}
		
		// 모델에 추가
		model.addAttribute("rsvList", rsvList);
		model.addAttribute("rsvfn", rsvfn);
		model.addAttribute("seatCounts", seatCounts);  // 좌석 수 맵 추가
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		
		return "/admin/rsvdList";
	}

	@Override
	public String routesList(Integer page, String selectedDate, String routeType, Model model) {
		int itemsPerPage = 5;
		int start = (page - 1) * itemsPerPage;
		
		// 열차편 목록 가져오기 (기존 로직 유지)
		List<RoutesDto> routesList;
		if(selectedDate != null && !selectedDate.isEmpty()) {
			routesList = romapper.getRoutesByDate(selectedDate);
		}
		else {
			routesList = romapper.getAllRoutes();
		}
		
		// 각 열차편의 총 좌석 수를 가져오기
		List<Map<String, Object>> avaiSeatsList = romapper.getTotalSeatsByRouteid();
		
		System.out.println("avaiSeatsList: " + avaiSeatsList);
		
		Map<Integer, Long> avaiSeatsMap = new HashMap<>();  // Long 타입으로 변경
		
		for(Map<String, Object> seatInfo : avaiSeatsList) {
			Integer Routeid = (Integer) seatInfo.get("routeid");
			Long avaiSeats = (Long) seatInfo.get("avaiSeats");  // Long으로 변경
			avaiSeatsMap.put(Routeid, avaiSeats);
		}
		
		// 각 Dto에 총 좌석 수 설정
		routesList.forEach(routes -> {
			Long avaiSeats = avaiSeatsMap.get(routes.getRouteid());
			routes.setAvaiSeats(avaiSeats != null ? avaiSeats.intValue() : 0);  // int로 변환
		});
		
		// 출발역에 따라 분류 (기존 로직 유지)
		List<RoutesDto> seoulRoutes = routesList.stream()
				.filter(routes -> routes.getDeparture().equals("서울역")).collect(Collectors.toList());
		
		List<RoutesDto> pusanRoutes = routesList.stream()
				.filter(routes -> routes.getDeparture().equals("부산역")).collect(Collectors.toList());
		
		List<RoutesDto> otherRoutes = routesList.stream()
				.filter(routes -> !routes.getDeparture().equals("서울역") && !routes.getDeparture().equals("부산역"))
				.collect(Collectors.toList());
		
		// 각 열차편 분류에 따라 페이지네이션 처리 및 JSP에 데이터 전달
		if("all".equals(routeType)) {
			List<RoutesDto> pagedRoutes=routesList.subList(start, Math.min(start+itemsPerPage, routesList.size()));
			int totalPages=(int) Math.ceil((double)routesList.size()/itemsPerPage);
			model.addAttribute("routesList", pagedRoutes);
			model.addAttribute("totalPages", totalPages);
			model.addAttribute("currentPage", page);
		}
		else if("서울역".equals(routeType)) {
			List<RoutesDto> pagedSeoulRoutes = seoulRoutes.stream()
					.skip(start).limit(itemsPerPage).collect(Collectors.toList());
			int totalSeoulPages = (int) Math.ceil((double) seoulRoutes.size() / itemsPerPage);
			model.addAttribute("pagedSeoulRoutes", pagedSeoulRoutes);
			model.addAttribute("totalSeoulPages", totalSeoulPages);
			model.addAttribute("currentSeoulPage", page);
		}
		else if("부산역".equals(routeType)) {
			List<RoutesDto> pagedPusanRoutes = pusanRoutes.stream()
					.skip(start).limit(itemsPerPage).collect(Collectors.toList());
			int totalPusanPages = (int) Math.ceil((double) pusanRoutes.size() / itemsPerPage);
			model.addAttribute("pagedPusanRoutes", pagedPusanRoutes);
			model.addAttribute("totalPusanPages", totalPusanPages);
			model.addAttribute("currentPusanPage", page);
		}
		else if("other".equals(routeType)) {
			List<RoutesDto> pagedOtherRoutes = otherRoutes.stream()
					.skip(start).limit(itemsPerPage).collect(Collectors.toList());
			int totalOtherPages = (int) Math.ceil((double) otherRoutes.size() / itemsPerPage);
			model.addAttribute("pagedOtherRoutes", pagedOtherRoutes);
			model.addAttribute("totalOtherPages", totalOtherPages);
			model.addAttribute("currentOtherPage", page);
		}
		
		model.addAttribute("selectedDate", selectedDate);
		return "/admin/routesList";  // 전체 페이지를 반환합니다.
	}
	
	@Override
	public String rsvChart(Model model) {
		// 월별 예약 통계 데이터
		List<String> monthLabels = rmapper.getMonthLabels();
		List<Integer> monthRsv = rmapper.getMonthRsv();
		
		// 항공편별 예약 통계 데이터
		List<String> routeLabels = rmapper.getRouteLabels();
		List<Integer> routeRsv = rmapper.getRouteRsv();
		
		// 모델에 데이터 추가
		model.addAttribute("monthLabels", new Gson().toJson(monthLabels));
		model.addAttribute("monthRsv", new Gson().toJson(monthRsv));
		model.addAttribute("routeLabels", new Gson().toJson(routeLabels));
		model.addAttribute("routeRsv", new Gson().toJson(routeRsv));
		
		return "admin/rsvChart";  // JSP 파일로 이동
	}
	
	@Override
	public String memberList(HttpServletRequest request, Model model) {
		// 페이지 값 받기 (기본값 1)
		String pageParam = request.getParameter("page");
		int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
		
		int itemsPerPage = 10; // 페이지당 출력할 항목 수
		int totalItems = umapper.getTotalUserCount(); // 전체 회원 수 가져오기
		int totalPages = (int)Math.ceil((double) totalItems / itemsPerPage);
		
		// 현재 페이지에 맞는 데이터 가져오기
		int offset = (page - 1) * itemsPerPage;
		List<UserDto> ulist = umapper.getUserList(offset, itemsPerPage);
		
		// 회원 리스트와 예약 리스트 매칭 (userid 기준으로 각 회원의 최근 예약만 가져옴)
		for(UserDto user : ulist) {
			// 각 회원의 최근 예약 한 건을 가져옴
			ReservDto recentReserv = rmapper.getMyrsv(user.getUserid());
			if(recentReserv != null) {
				user.setReservlist(Collections.singletonList(recentReserv)); // 최근 예약 하나만 설정
			}
			else {
				user.setReservlist(Collections.emptyList()); // 예약이 없는 경우 빈 리스트 설정
			}
		}
		
		model.addAttribute("ulist", ulist);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		
		return "/admin/memberList";
	}
	
	@Override
	public String memberUp(UserDto mdto, @RequestParam int id, @RequestParam int level, Model model) {
		mdto = new UserDto();		
		// id와 state 값을 mdto 객체에 세팅
		mdto.setId(id);
		mdto.setLevel(level);
		
		umapper.memberUp(mdto);
		return "redirect:/admin/memberList";
	}
	
	@Override
	public String oneMeminfo(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		
		// 현재 페이지 정보 가져오기
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		int itemsPerPage = 5;  // 한 페이지당 표시할 예약 개수
		int offset = (currentPage - 1) * itemsPerPage;  // OFFSET 계산
		
		// 유저 정보 가져오기
		UserDto member = umapper.getUserById(userid);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		List<ReservDto> myrsv = new ArrayList<>();
		int totalReservlist = 0;
		
		if(member != null) {
			// 특정 유저의 예약 리스트 (페이징 적용)
			myrsv = rmapper.getRsvUserid(userid, itemsPerPage, offset);
			
			// 전체 예약 수 가져오기 (페이징을 위해 필요)
			totalReservlist = rmapper.getTresByUser(userid);
			
			for(ReservDto reserv : myrsv) {
				// offerday +1일 처리
				String offerday = reserv.getOfferday();
				if(offerday != null) {
					LocalDate parsedDate = LocalDate.parse(offerday, formatter);
					LocalDate adjustedDate = parsedDate.plusDays(1);  // +1일
					reserv.setOfferday(adjustedDate.format(formatter));
				}
			}
			member.setReservlist(myrsv);
		}
		
		// 총 페이지 수 계산
		int totalPages = (int)Math.ceil((double) totalReservlist / itemsPerPage);
		
		// 모델에 데이터 추가
		model.addAttribute("member", member);
		model.addAttribute("myrsv", myrsv);  // 페이징 적용된 예약 리스트
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalReservations", totalReservlist);
		
		return "/admin/oneMeminfo";
	}
	
	@Override
	public String cancelConfirm(HttpServletRequest request) {
	    String referer = request.getHeader("Referer"); // 요청을 보낸 이전 페이지 URL 가져오기
	    String rid = request.getParameter("reservid"); // 취소할 예약 ID
	    String roid = request.getParameter("routeid");
	    int resnum=Integer.parseInt(request.getParameter("resnum"));
	    
	    // 예약 취소 처리
	    rmapper.cancelSeat(roid, rid);
	    rmapper.cancelTrainSeat(roid, resnum);
	    rmapper.cancelConfirm(rid);
	    
	    if(referer != null && !referer.isEmpty()) {
	        try {
	            URI refererUri = new URI(referer);
	            String query = refererUri.getQuery(); // 기존 쿼리 스트링 가져오기

	            // 기존 쿼리 스트링이 있으면 유지하면서 reservationId 추가
	            String newQuery = (query != null && !query.isEmpty()) 
	                ? query + "&reservationId=" + rid 
	                : "reservationId=" + rid;

	            return "redirect:" + refererUri.getPath() + "?" + newQuery;
	        }
	        catch(URISyntaxException e) {
	            e.printStackTrace();
	        }
	    }

	    // referer가 없거나 예외 발생 시 기본 페이지로 이동
	    return "redirect:/admin/rsvdList";
	}
	
	@Override
	public String cancelRejection(HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		String rid=request.getParameter("reservid");
		rmapper.cancelRejection(rid);
		
		if(referer != null && !referer.isEmpty()) {
	        try {
	            URI refererUri = new URI(referer);
	            String query = refererUri.getQuery(); // 기존 쿼리 스트링 가져오기

	            // 기존 쿼리 스트링이 있으면 유지하면서 reservationId 추가
	            String newQuery = (query != null && !query.isEmpty()) 
	                ? query + "&reservationId=" + rid 
	                : "reservationId=" + rid;

	            return "redirect:" + refererUri.getPath() + "?" + newQuery;
	        }
	        catch(URISyntaxException e) {
	            e.printStackTrace();
	        }
	    }
		return "redirect:/admin/rsvdList";
	}
	
	@Override
	public String payReturn(HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		String rid=request.getParameter("reservid");
		rmapper.payReturn(rid);
		
		if(referer != null && !referer.isEmpty()) {
	        try {
	            URI refererUri = new URI(referer);
	            String query = refererUri.getQuery(); // 기존 쿼리 스트링 가져오기

	            // 기존 쿼리 스트링이 있으면 유지하면서 reservationId 추가
	            String newQuery = (query != null && !query.isEmpty()) 
	                ? query + "&reservationId=" + rid 
	                : "reservationId=" + rid;

	            return "redirect:" + refererUri.getPath() + "?" + newQuery;
	        }
	        catch(URISyntaxException e) {
	            e.printStackTrace();
	        }
	    }
		return "redirect:/admin/rsvdList";
	}

	@Override
	public String addRoute(Model model) {
		List<StationsDto> stations = romapper.getAllStations();
		List<TrainesDto> traines = romapper.getAllTraines();
		model.addAttribute("stations", stations);
		model.addAttribute("traines", traines);
		return "admin/addRoute";
	}
	
	@Override
	public String addRoutes(
			@RequestParam String departure, @RequestParam String arrival, @RequestParam String departureTime,
			@RequestParam String arrivalTime, @RequestParam("ftimeValue") String ftime, @RequestParam int trainid,
			@RequestParam int unitPrice, @RequestParam String returnDeparture, @RequestParam String returnArrival,
			@RequestParam String returnDepartureTime, @RequestParam String returnArrivalTime,
			@RequestParam("returnFtimeValue") String returnFtime, @RequestParam int returnTrainid,
			@RequestParam int returnUnitPrice, Model model, RedirectAttributes redirectAttributes) {
		
		try {
			// 1. 왕복 루트 추가
			romapper.addRoutes(departure, arrival, departureTime, arrivalTime, ftime, trainid, unitPrice);
			romapper.addRoutes(returnDeparture, returnArrival, returnDepartureTime, returnArrivalTime, returnFtime, returnTrainid, returnUnitPrice);
			
			// 성공 메시지 설정
			redirectAttributes.addFlashAttribute("message", "성공적으로 추가되었습니다.");
			
			// 경로에 대한 좌석 추가 두번
			addSeatsForRoute();
			addSeatsForRoute();
			
			return "redirect:/admin/routesList";
		}
		catch(Exception e) {
			redirectAttributes.addFlashAttribute("message", "오류가 발생했습니다: " + e.getMessage());
			return "redirect:/admin/addRoute";
		}
	}
	
	private void addSeatsForRoute() {
		Integer routeid = romapper.getRouteidForAddingSeats();
		if(routeid != null) {
			Map<String, Object> trainData = romapper.getRouteCapa(routeid);
			if(trainData != null) {
				int capacity = (int) trainData.get("seat");
				
				// 좌석 정보 가져오기
				List<SeatDto> seatNumbers = romapper.getSeatsForRoute(routeid);
				
				if(seatNumbers.size() < capacity) {
					throw new RuntimeException("좌석 개수가 부족합니다. 추가 작업이 필요합니다.");
				}
				
				// 좌석 추가
				Map<String, Object> params = new HashMap<>();
				params.put("routeid", routeid);
				params.put("seatNumbers", seatNumbers);
				romapper.addSeats(params);
			}
		}
	}
	
	
}
