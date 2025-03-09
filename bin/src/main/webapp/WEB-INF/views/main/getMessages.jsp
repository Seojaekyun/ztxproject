<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
	// 애플리케이션 스코프에서 채팅 메시지 리스트를 가져옴
	@SuppressWarnings("unchecked")
	List<String> chatMessages = (List<String>) application.getAttribute("chatMessages");
	
	if (chatMessages != null) {
		for (String message : chatMessages) {
			out.println("<div>" + message + "</div>");  // 각 메시지를 출력
		}
	} else {
		out.println("저장된 메시지가 없습니다.");
	}
%>