<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bList</title>
</head>
<body>
	
	<h3>게시글 보기</h3>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<!-- (반복)데이터 뿌림 -->
		
		<%
			ArrayList<BoardDTO> boardList =BoardDAO.getInstance().getBoardList();
			
		
			for(BoardDTO boardDTO : boardList){
		%>
			
			<tr>
				<td><%=boardDTO.getBoardId() %></td>
				<td><%=boardDTO.getSubject() %></td>
				<td><%=boardDTO.getWriter() %></td>
				<td><%=boardDTO.getEnrollDt() %></td>
				<td><%=boardDTO.getReadCnt() %></td>
				
			</tr>
		
		
		
		<% 		
			}
		
		
		%>
		
		
		<tr>
		
			<td colspan="5">
				<input type="button" value="게시글 작성" onclick="location.href='bWrite.jsp'">
			</td>
		</tr>
	</table>
	
	
</body>
</html>