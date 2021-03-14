<%@page import="bean.ProductDAO"%>
<%@page import="bean.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
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
				String site = "https://raw.githubusercontent.com/jjoon0928/mediaserver-studying/main";
				if(session.getAttribute("id") != null){
			%>
				<%= session.getAttribute("id") %>님 환영합니다.
			<%
				} else{
			%>
				손님 환영합니다.
			<%
				}
			%>
			제품 정보 처리가 들어갈 부분...
			<hr color="red">
			<%
				ProductDAO dao = new ProductDAO();
			// ctrl + shift + m : 자동 import
				ArrayList<ProductDTO> list = dao.list();
			// 1. 반복문으로 dto를 하나씩 꺼내준다.
			// 2. dto에서 각 항목의 값을 하나씩 꺼내준다.
			%>
			<table>
			<tr>
				<td>상품명</td>
				<td>상품가격</td>
				<td>상품이미지</td>
			</tr>
			<% for(ProductDTO dto : list){ %>	
			<tr>
				<td>
				<a href="product2.jsp?id=<%= dto.getId() %>"><%= dto.getName() %></a>
				</td>
				<td><%= dto.getPrice() %></td>
				<td>
					<img src="<%= site %>/<%= dto.getImg() %>" width=150 height=150>
				</td>
			</tr>
			<% } %>
			</table>
		</div>	
	</div>
</body>
</html>



















