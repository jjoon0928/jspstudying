<%@page import="bean.BbsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	BbsDAO dao = new BbsDAO();
	boolean result = dao.delete(id);
	if(result){
		response.sendRedirect("bbs.jsp");
	} else{
		out.print("삭제 시 문제 발생!!");
	}
%>