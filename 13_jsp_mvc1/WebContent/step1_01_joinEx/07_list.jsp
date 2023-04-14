<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	
	
	<%
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select문의 결과를 저장할 객체
		
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/join_ex?serverTimezone=UTC" , "root" , "root");
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER");
			rs = pstmt.executeQuery();
			
			/*
			
				# db의 컬럼명을 가져 오는 2가지 방법
				
					1) rs.get자료형메서드("컬럼명");
					  
						ex) 
							rs.getString("PRODUCT_CD"); 
							rs.getInt("PRODUCT_PRICE");
							rs.getDate("ENROLL_DT");
					
							
					2) rs.get자료형메서드(index);
						
						ex) 
							rs.getString(1);
							rs.getInt(2);
							rs.getDate(3);
					
						- 유지보수 및 가독성 향상을 위해서 컬럼명지정 방식을 권장한다.
						- index가 1부터 시작되는 점을 유의해야 한다.
				
			*/
		%>	
			
			<table border="1">
				
				
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>가입일자</th>
				</tr>
			
			
			
			
			
			
		<% 	
			while (rs.next()) { // select문의 결과물이 1row가 있으면
				String id = rs.getString("ID"); // rs.getString(1) : 첫 번째를 가져와라
				String passwd = rs.getString("PASSWD"); // rs.getString(2) : 두 번째를 가져와라
				String name = rs.getString("NAME"); // rs.getString(3) : 세 번째를 가져와라
				Date joinDate = rs.getDate("JOIN_DATE"); // rs.getDATE(4) : 네 번째를 가져와라
				
				
			
				// System.out.println(id + " / " + passwd + " / " + name + " / " + joinDate);
		%>
			<tr>
				<td><%=id %></td>
				<td><%=passwd %></td>
				<td><%=name %></td>
				<td><%=joinDate %></td>
			</tr>
			
		
		<% 
			}
		%>
		
		</table>
		<a href="00_main.jsp">메인으로 이동</a>
		
		<% 	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		
	
	%> 



</body>
</html>