<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bWrite</title>
<script src="../ckeditor/ckeditor.js"></script> <!-- ckeditor적재하기(내용게시판디자인된거) -->
</head>
<body>
	
	<form action="bWritePro.jsp" method="post">
		<h3>게시글 쓰기</h3>
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer"></td>
			
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="30" name="content"></textarea>
					<script>CKEDITOR.replace("content");</script>
				</td>
			</tr>				
			
			
			
			
			
		
		</table>
				<p>
				<input type="submit" value="작성" >
				<input type="button" value="전체게시글보기">
				</p>
	</form>
</body>
</html>