<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>  
<%@ page import="bbs.Bbs" %>  
<%@ page import="bbs.BbsDAO" %>  
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv='Content-Type' content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximun-scale=1"> 
<link rel="stylesheet" href="css/bootstrap.css"> 

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

 <title>메인페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

	<style>
	
		*{
		margin:0;
		padding:0;
		box-sizing:border-box;
		-moz-box-sizing:border-box;
		-webkit-box-sizing:border-box;
		font-family: 'Noto Sans KR', sans-serif;
		}
	
		
		a:link, a:hover, a:visited{
			color:#fff;
			text-decoration:none;
			text-shadow:1px 1px 0 #283744;
		}	
		nav {
			width:100%;
			height:auto;
			background:#6F548A;
			opacity:0.8;
			font-size:1.2em;
			font-weight:bold;
			position:relative;
		}
		nav ul{
		display:none;
		height:auto;
		}
		
		nav ul li {
			display:block;
			width:100%;
			text-align:center;
			border-bottom:1px solid #392B47;
		}
		nav ul li a{
		line-height:40px;
		}
		nav a#trigger{
		display:block;
		background-color:#392B47;
		width:100%
		padding-left:15px;
		line-height:30px;
		position:relative;
		text-align:center;
		}	
		@media screen and (min-width:721px){
			nav{
				height : 40px;
				border-bottom:2px solid #392B47;
			}
			nav ul {
				display:block;
				width:720px;
				height:40px;
				padding:0;
				margin:0 auto;
			}
			nav ul li {
			display:inline-block;
			width:120px;
			border-bottom:0;
			border-right:1px solid #392B47;
			margin-right : -6px;
			}
			
			nav ul li:last-child{
				border-right: 0;
			}
			nav ul li a {
				font-size:1em;
				ine-height:40px;
			}
			
			
			nav a#trigger{
			display:none;
			}
		}
		
	</style>




</head>
<body>
	<%
	
		String memberID = null;
		if(session.getAttribute("memberID") !=null) {
			memberID = (String) session.getAttribute("memberID");
		}
		if(memberID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
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
		
	
	%>
	
	
	
	
	<nav>
		<ul>
		<li><a href="index.jsp">MAIN</a></li>
		<li><a href="about.jsp">ABOUT</a></li>
		<li><a href="bbs.jsp">등록동물현황</a></li>
		<li><a href="#">등록하기</a></li>
					<li>
					<ul>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
					</li>
		</ul>
		
		
		<a href="#" id="trigger">MENU</a>
	</nav>

	<script src="js/jquery-2.2.4.min.js"></script>
	
	<script>
	$(function(){
		var trigger = $('#trigger');
		var menu = $('nav ul');
		$(trigger).on('click',function(e){
			e.preventDefault();
			menu.slideToggle();
		});
		
		$(window).resize(function(){
			var w = $(window).width();
			if(w>320 && menu.is('hidden')){
				menu.removeAttr('stlye');
			}
		});
	});
	</script>
	
	<div class="col-md-2"></div>
	<div class="col-md-8">	
	<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
	<div class="container">
	<table class="table table-bordered">
    <th style="background-color:#D8D1DE; text-align:center;" colspan='2'>수정 페이지 입니다</th>
           
            <tr>
                <th>제목</th>
                <td><input type="text" placeholder="제목을 입력하세요. "  name="bbsTitle" class="form-control" maxlength="50" value="<%=bbs.getBbsTitle()%>"/></td>
            </tr>
            <tr>
                <th>축종 </th>
                <td><select name ="bbsAni" class="form-control"><%=bbs.getBbsAni()%>
	  			<option>전체</option>
				<option>개</option>
				<option>고양이</option>
				<option>햄스터</option>
				<option>기타</option>
				</select></td>
            </tr>
                  <tr>
                <th>지역 </th>
                <td><input type="text" placeholder="지역을 입력하세요" name="bbsArea" class="form-control" value="<%=bbs.getBbsArea()%>"/></td>
            </tr>
            <tr>
                <th>내용 </th>
                <td><textarea cols="10" placeholder="내용을 입력하세요. " name="bbsContent" class="form-control" maxlength="2048" style="height:300px"><%=bbs.getBbsContent()%></textarea></td>
            </tr>
            <tr>
                <th>이미지 </th>
                
                <td><div class="col-md-8"><input type="text" placeholder="파일을 선택하세요. " name="filename" class="form-control" readOnly=true>
               	</div>
      			<div class="col-md-4"><input type="submit" class="btn btn-default form-control" value="이미지등록"></div>
                
                </td>
            </tr>
            <tr>
                <td colspan="2">
                
                    <input type="submit" class="btn btn-default form-control" value="수정하기">
                
                </td>
            </tr>
    </tbody>

</table>
</div>
</form>
<div class="col-md-2"></div>
</div>

	
</body>
</html>