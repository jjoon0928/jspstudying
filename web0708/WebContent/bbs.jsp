<%@page import="bean.BbsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/project.css">
</head>
<body>
	<div id=total>
		<div id=top>
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id=top2>
			<jsp:include page="top2.jsp"></jsp:include>
		</div>
		<div id=center>
			<%
				if(session.getAttribute("id") != null){
			%>
				<%= session.getAttribute("id") %>님 환영합니다.
				<a href="bbs3.jsp"><button>글쓰기</button></a>
			<%
				} else{
			%>
				손님 환영합니다.
			<%
				}
			%>
			
			<hr color="red">
			<%
				BbsDAO dao = new BbsDAO();
				// ctrl + shift + m : 자동 import
				ArrayList<BbsDTO> list = dao.list();
				// 1. 반복문으로 dto를 하나씩 꺼내준다.
				// 2. dto에서 각 항목의 값을 하나씩 꺼내준다.
			%>
			<table>
			<tr>
				<td>아이디</td>
				<td>제목</td>
				<td>작성자</td>
			</tr>
			<% for(BbsDTO dto : list){ %>	
			<tr>
				<td style="width: 200px;"> <%= dto.getId() %></td>
				<td>
					<a href="bbs2.jsp?id=<%= dto.getId() %>"><%= dto.getTitle() %></a>
				</td>
				<td>
					<%= dto.getWriter() %>
				</td>
			</tr>
			<% } %>
			</table>
		</div>
	</div>
</body>
</html>