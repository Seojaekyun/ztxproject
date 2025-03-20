package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.PromotDto;
import com.example.demo.dto.ReviewDto;
import com.example.demo.mapper.PromotMapper;
import com.example.demo.mapper.ReviewMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ms")
public class MainServiceImpl implements MainService {
	@Qualifier("ms")
	private List<String> chatMessages = new ArrayList<>();
	@Autowired
	private PromotMapper pmapper;
	@Autowired
	private ReviewMapper revMapper;

	@Override
	public String index(HttpServletRequest request, Model model) {
		List<PromotDto> plist = pmapper.plist();
		List<ReviewDto> rvlist = revMapper.rvlist();
		
		model.addAttribute("plist", plist);
		model.addAttribute("rvlist", rvlist);
		return "/main/index";
	}
	
	@Override
    public String saveMessage(String message, boolean isAdmin) {
        String sender = isAdmin ? "팅커벨: " : "손님: ";
        chatMessages.add(sender + message);
		return sender;
    }

    // 저장된 메시지 목록 반환 메서드
    @Override
    public List<String> getMessages() {
        return new ArrayList<>(chatMessages);  // 리스트 복사하여 반환
    }
    
    @Override
    public String clearChatMessages() {
        chatMessages.clear();  // 채팅 기록을 비움
		return null;
    }
    
	@Override
	public String reservInfo() {
		return "/reserv/reservInfo";
	}
	
	@Override
	public String csCustomer(HttpServletRequest request, Model model) {
		return "/other/csCustomer";
	}
	
	@Override
	public String pickup() {
		return "/other/pickup";
	}
	
	@Override
	public String trainservice() {
		return "/other/trainservice";
	}
	
	@Override
	public String theme() {
		return "/other/theme";
    }
	
	@Override
	public String free() {
		return "/other/free";
	}
	
	@Override
	public String etiquette() {
		return "/other/etiquette";
	}
	
	@Override
	public String station() {
		return "/other/station";
	}
	
	@Override
	public String info() {
		return "/other/info";
	}
	
	@Override
	public String traininfo() {
		return "/other/traininfo";
	}
	
	@Override
    public String mship() {
        return "/other/mship";  
    }
    
	@Override
    public String mshipsogae() {
    	return "/other/mshipsogae";
    }
    
	@Override
    public String mshipcoupon() {
    	return "/other/mshipcoupon";
    }
	
	
}
