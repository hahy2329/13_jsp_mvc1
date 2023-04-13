<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertPro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");	
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
	
	
		//mysql 연결
		
		//데이터베이스를 연결하기 위한 객체
		Connection conn = null;
		
		//쿼리문을 실행하기 위한 객체 
		PreparedStatement pstmt=null;
		
		
		//insert 쿼리 실행
	
	
	%>
	
	메인화면으로 이동 
	

</body>
</html>