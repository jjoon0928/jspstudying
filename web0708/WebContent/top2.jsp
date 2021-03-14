<%@page import="bean.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 장바구니 세션이 없으면, 장바구니 없음을 프린트
if(session.getAttribute("basket") == null){
	out.print("장바구니 개수: 없음<br>");
} else{ // 장바구니 세션이 있으면, 세션목록을 가지고 와서 개수를 프린트
	ArrayList<ProductDTO> list =(ArrayList<ProductDTO>)session.getAttribute("basket");
	out.print("장바구니 개수: " + list.size() + "<br>");
	int sum = 0;
	for(ProductDTO dto : list){
		sum = sum + Integer.parseInt(dto.getPrice());
	}
	out.print("장바구니 금액: " + sum + "원");
}
%>