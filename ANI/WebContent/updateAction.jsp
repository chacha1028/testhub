<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
		
		int bbsID=0;
		if(request.getParameter("bbsID") != null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!memberID.equals(bbs.getMemberName())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		else if(request.getParameter("bbsAni")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('축종을 선택해주세요')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(request.getParameter("bbsArea")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('지역을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else if(request.getParameter("bbsTitle")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		
		}else if(request.getParameter("bbsContent")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.update(bbsID, request.getParameter("bbsAni"), request.getParameter("bbsArea"), request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정실패!')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정완료!')");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
		}
	%>
</body>
</html> 



