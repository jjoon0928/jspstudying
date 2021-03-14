<%@page import="bean.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="bean.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
	<%
		ArrayList<ProductDTO> list = null;
		if (dto.getId() != null) { // 장바구니에 데이터를 넣으면서 페이지를 호출한 경우
			// 장바구니에 넣어야 함.
			// 기존에 장바구니에 넣어둔 것이 있었으면 목록을 리스트에 넣어서 세션으로 잡아뒀을 것임.
			// 장바구니 세션이 있는지 판단
			// 장바구니 세션이 이미 있는 경우에는 장바구니 리스트가 이미있음
			// => 새로이 추가된 물건 정보를 리스트에 추가하면 됨.
			// 장바구니 세션이 없는 경우에는 장바구니 리스트가 없음.
			// 장바구니 리스트 만들어 
			// 내 물건 추가하면 됨.
			if(session.getAttribute("basket") == null){
				list = new ArrayList<>();
			}else{
				list = (ArrayList<ProductDTO>)session.getAttribute("basket"); // down casting
				// session.setAttribute(name, Object자리) : 자동형변환
				// 단점은 ArrayList의 get(), size()의 기능을 쓸 수 없다.
				// 강제형변환해서 다시 ArrayList타입으로 강제형변환해주어야 한다.
			}
			list.add(dto);
			session.setAttribute("basket", list);
		} else { // 페이지를 단순히 호출한 경우
			// 장바구니에 있는 내용을 프린트하면 됨.
			// 장바구니가 있으면 가지고 오고, 장바구니가 없으면 없다.
			if(session.getAttribute("basket") == null){
				
			} else{
				list = (ArrayList<ProductDTO>)session.getAttribute("basket");
			}
		}
	%>
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
				if (session.getAttribute("id") != null) {
			%>
			<%=session.getAttribute("id")%>님 환영합니다.
			<%
				} else {
			%>
			손님 환영합니다.
			<%
				}
			%>
			<% 
			if(session.getAttribute("basket") == null){
				out.print("장바구니 개수: 없음<br>");
			} else{
				out.print("장바구니 개수: " + list.size() + "개 들어있음<br>");
			%>
			<hr>
			<table>
				<tr>
					<td>아이디</td>
					<td>상품명</td>
					<td>상품가격</td>
					<td>주문하기</td>
				</tr>
			</table>
				<%for(ProductDTO dto2 : list) {%>
				<table>
				<tr>
					<td><%= dto2.getId() %></td>
					<td><%= dto2.getName() %></td>
					<td><%= dto2.getPrice() %></td>
					<td><input id="count" style="width:50px;" value="1"></td>
					<td>
						<button>주문</button>
					</td>
				</tr>
			</table>
			<%
			}
				
			%>
			<%} %>
		</div>
	</div>
</body>
</html>











