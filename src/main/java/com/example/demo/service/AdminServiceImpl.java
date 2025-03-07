package com.example.demo.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.ReservDto;
import com.example.demo.dto.RoutesDto;
import com.example.demo.mapper.ReservMapper;
import com.example.demo.mapper.RoutesMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private ReservMapper rmapper;
	
	@Autowired
	private RoutesMapper romapper;

	@Override
	public String adminIndex(HttpSession session, HttpServletRequest request, Model model) {
		Object useridObj = session.getAttribute("adminid");
		
		if (useridObj == null) {
			return "redirect:/main/index";  // userid가 null이면 메인 페이지로 리다이렉트
		}
		
		String adminid = useridObj.toString();
		
		if ("administrator".equals(adminid)) {
			// 현재 날짜 및 시간 구하기
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			
			// 항공편 5개 조회
			List<RoutesDto> departureList = romapper.getDepartureRoutes();
			List<RoutesDto> arrivalList = romapper.getArrivalRoutes();
			
			model.addAttribute("departureList", departureList);
			model.addAttribute("arrivalList", arrivalList);
			/*
			// 모든 문의 리스트 조회
			ArrayList<InquiryDto> ilist = imapper.ilist();
			model.addAttribute("ilist", ilist);
			
			// State별 문의 수 조회
			List<StateCountDto> countsList = imapper.listCountsPerState();
			countsList.sort((entry1, entry2) -> Integer.compare(entry2.getCount(), entry1.getCount()));
			
			for (int i = 0; i < countsList.size(); i++) {
				countsList.get(i).setRank(i + 1);  // 1위부터 순위 부여
			}
			
			model.addAttribute("countsList", countsList);
			*/
			// 현재 시간 이후의 예약 5개씩 조회
			List<ReservDto> rsvList = rmapper.getRsvanow().stream().filter(rsv -> {
				// String 타입의 departureTime을 LocalDateTime으로 변환
				LocalDateTime departureTime = LocalDateTime.parse(rsv.getRouteTime(), formatter);
				return departureTime.isAfter(now);  // 현재 시간 이후인지 확인
			}).collect(Collectors.toList());
			
			// GMP로 시작하는 항공편의 예약 리스트
			List<ReservDto> seoulRsv = rsvList.stream()
					.filter(rsv -> rsv.getDeparture().equals("서울역"))
					.limit(5).collect(Collectors.toList());
			model.addAttribute("seoulRsv", seoulRsv);
			
			// ICN으로 시작하는 항공편의 예약 리스트
			List<ReservDto> pusanRsv = rsvList.stream()
					.filter(rsv -> rsv.getDeparture().equals("부산역"))
					.limit(5).collect(Collectors.toList());
			model.addAttribute("pusanRsv", pusanRsv);
			
			// 기타 항공편의 예약 리스트
			List<ReservDto> otherRsv = rsvList.stream()
					.filter(rsv -> !rsv.getDeparture().equals("서울역") && !rsv.getDeparture().equals("부산역"))
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
        if (page == null || page < 1) {
            page = 1;
        }
        if (seoulPage == null || seoulPage < 1) {
        	seoulPage = 1;
        }
        if (pusanPage == null || pusanPage < 1) {
        	pusanPage = 1;
        }
        if (otherPage == null || otherPage < 1) {
            otherPage = 1;
        }

        // 선택한 날짜가 있을 경우 해당 날짜에 맞는 예약 데이터만 가져오기
        List<ReservDto> rsvList;
        if (selectedDate != null && !selectedDate.isEmpty()) {
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
        for (Map<String, Object> availableSeat : availableSeatsList) {
            availableSeatsMap.put((Integer) availableSeat.get("flight_id"), ((Long) availableSeat.get("availableSeats")).intValue());
        }
        model.addAttribute("availableSeatsMap", availableSeatsMap);

        model.addAttribute("selectedDate", selectedDate);
        
        System.out.println("이것이다");
        for (ReservDto rsv : seoulList) {
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

}
