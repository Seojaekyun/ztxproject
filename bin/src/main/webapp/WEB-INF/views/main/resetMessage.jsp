<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    // 채팅 메시지 리스트를 초기화
    application.setAttribute("chatMessages", new ArrayList<String>());
    out.println("채팅 기록이 초기화되었습니다.");
%>
