<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    // 채팅 메시지를 저장할 리스트를 애플리케이션 스코프에서 가져옴
    @SuppressWarnings("unchecked")
    List<String> chatMessages = (List<String>) application.getAttribute("chatMessages");
    if (chatMessages == null) {
        chatMessages = new ArrayList<>();
        application.setAttribute("chatMessages", chatMessages);
    }
    
    // 요청에서 받은 메시지를 리스트에 추가
    String message = request.getParameter("message");
    if (message != null && !message.trim().isEmpty()) {
        chatMessages.add(message);  // 사용자 또는 관리자의 메시지를 저장
        application.setAttribute("chatMessages", chatMessages);  // 갱신된 리스트를 저장
        out.println("메시지가 성공적으로 저장되었습니다.");  // 성공 메시지 출력
    }
    else {
        out.println("메시지가 유효하지 않습니다.");
    }
%>