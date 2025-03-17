package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ms")
public class MainServiceImpl implements MainService {

	@Qualifier("ms")
	private List<String> chatMessages = new ArrayList<>();

	@Override
	public String index(HttpServletRequest request, Model model) {
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
	public String csCustomer(HttpServletRequest request, Model model) {
		return "/main/csCustomer";
	}

	@Override
	public String pickup() {
		return "/main/pickup";
	}

}
