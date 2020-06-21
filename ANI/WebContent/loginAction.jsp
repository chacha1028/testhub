<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="memberID" />
<jsp:setProperty name="member" property="memberPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >

<title>로그인</title>


</head>
<body>

	<%
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.login(member.getMemberID(),member.getMemberPassword());
		if(result == 1){
			session.setAttribute("memberID",member.getMemberID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가  틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 ID입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB에러.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>



</body>
</html> 



