<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsAni" />
<jsp:setProperty name="bbs" property="bbsArea" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >

<title>로그인</title>


</head>
<body>

	<%
	
		String memberID = null;
		String memberName = null;
		if(session.getAttribute("memberID") !=null) {
			memberID = (String) session.getAttribute("memberID");
			memberName = (String) session.getAttribute("memberName");
				
		}
		


		if(bbs.getBbsAni()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('축종을 선택해주세요')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(bbs.getBbsArea()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('지역을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else if(bbs.getBbsTitle()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		
		}else if(bbs.getBbsContent()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
			
		}else{
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsAni(),bbs.getBbsArea(),bbs.getBbsTitle(), memberID, bbs.getBbsContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('등록실패!')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('등록완료!')");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
		}
	%>
</body>
</html> 



