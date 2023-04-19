<%@page import="step2_00_loginEx.MemberDTO"%>
<%@page import="step2_00_loginEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro</title>
</head>
<body>

	<%
	
		request.setCharacterEncoding("utf-8");
			
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(request.getParameter("memberId"));
		memberDTO.setPasswd(request.getParameter("passwd"));
		memberDTO.setName(request.getParameter("name"));
			
		boolean isUpdate = MemberDAO.getInstance().updateMember(memberDTO);
		
		if (isUpdate) {
	%>
			<script>
				alert("Information has changed");
				location.href = "00_main.jsp";
			</script>
	<% 		
		}
		else {
	%>	
			<script>
				alert("Check your Id or Password");
				history.go(-1);
			</script>
	<% 		
		}
	%>

</body>
</html>




