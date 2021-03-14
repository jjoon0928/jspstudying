<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="dto"/>
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
			MemberDAO dao = new MemberDAO();
			boolean result = dao.insert(dto);
			if(result){
			%>		
			<h3>회원가입 성공하셨습니다.</h3>
			<a href="member.jsp">
				<button>로그인 페이지로</button>
			</a>
			<% 
			} else {
			%>
			<h3>회원가입 실패하셨습니다.</h3>
			<a href="member.jsp">
				<button>회원가입 페이지로</button>
			</a>
			<%
			}
			%>
		
		</div>
	</div>
</body>
</html>



















