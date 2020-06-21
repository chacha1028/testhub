<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="memberID" />
<jsp:setProperty name="member" property="memberPassword" />
<jsp:setProperty name="member" property="memberName" />
<jsp:setProperty name="member" property="memberGender" />
<jsp:setProperty name="member" property="memberEmail" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >

<title>로그인</title>


</head>
<body>

	<%
	
		if(member.getMemberID()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(member.getMemberPassword()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else if(member.getMemberName()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		
		}else if(member.getMemberGender()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성별을 선택해주세요')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(member.getMemberEmail()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");	

		}else{
			MemberDAO memberDAO = new MemberDAO();
			int result = memberDAO.join(member);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디입니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원 가입 완료!')");
					script.println("location.href = 'index.jsp'");
					script.println("</script>");
				}
		}
	%>
</body>
</html> 



