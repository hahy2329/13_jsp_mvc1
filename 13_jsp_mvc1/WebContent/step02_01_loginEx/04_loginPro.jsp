<%@page import="step2_00_loginEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>
	<%
	
		
		request.setCharacterEncoding("utf-8");
	
		String memberId = request.getParameter("memberId");
		String passwd = request.getParameter("passwd");
		
		boolean isLogin = MemberDAO.getInstance().loginMember(memberId, passwd);
		//if(MemberDAO.getInstance().loginMember(memberId, passwd))로 해두됨(변수를 두지 않고! 그건 사용자 마음)
		if(isLogin){
			session.setAttribute("memberId", memberId);
			session.setMaxInactiveInterval(60*10);
			//로그인 유지 10분 동안(메인화면에서도 로그인 유지가 된다.)
			
	%>		
			<script>
				alert("Logged in");
				location.href="00_main.jsp";
			</script>
			
	<%		
		}else{
			
		
			
	%>
	
		<script>
			alert("check your ID or password");
			history.go(-1);
		
		</script>
	
	<% 		
		}
		
		
	%>
	
	
	
	
	
</body>
</html>