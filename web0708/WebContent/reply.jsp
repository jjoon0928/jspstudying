<%@page import="bean.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="bean.ReplyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	ReplyDAO dao = new ReplyDAO();
	dao.insert(dto);
	response.sendRedirect("bbs2.jsp?id=" + dto.getOriid());

%>
