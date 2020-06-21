<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>

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
		
			#li{
				color:#000;
				text-decoration:none;
				text-shadow:none;
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
			
			#li{
				color:#000;
				text-decoration:none;
				text-shadow:none;
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
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	
	%>

	<nav>
		<ul>
		<li><a href="index.jsp">MAIN</a></li>
		<li><a href="about.jsp">ABOUT</a></li>
		<li><a href="bbs.jsp">등록동물현황</a></li>
		<li><a href="write.jsp">등록하기</a></li>
		<%
			if(memberID == null) {
		%>
					<li>
					<ul>
						<li><a href="login.jsp">로그인</a></li>
					</ul>
					</li>
		<%
			}else{
		%>
					<li>
					<ul>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
					</li>
		<%
			}
		%>
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
    	
    	 <table class="table table-list-search; table table-hover">    	 
                    <thead>
                    
					<tr>	                    
                     <th style="background-color:#D8D1DE; text-align:center;" colspan='7'>동네에 있는 동물들을 확인해보세요!</th>
                    </tr>
                       
                        <tr>
                            <th>글번호</th>
                            <th>축종</th>
                            <th>지역</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    	<%
                    		BbsDAO bbsDAO = new BbsDAO();
                    		ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                    		for(int i =0; i<list.size();i++){
                    	%>
                    
                    
                    
                        <tr>
                            <td><%= list.get(i).getBbsID() %></td>
                            <td><%= list.get(i).getBbsAni() %></td>
                            <td><%= list.get(i).getBbsArea() %></td>
                            <td><a id=li href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
                            <td><%= list.get(i).getMemberName() %></td>
                            <td><%= list.get(i).getBbsDate() %></td>
                        </tr>
                        <%		
                    		}
                        %>
                        
                    </tbody>
                </table>   
		<div class="col-md-2"></div>
		</div>
		
	
	
	
	<div class="container">
	<div class="row">
	<div class="col-md-6"></div>	

	<div class="col-md-1">
	<select name="searchType" class="form-control">
	  <option value="전체">전체</option>
	  <option value="축종">축종</option>
	  <option value="지역">지역</option>
	  <option value="제목">제목</option>
	  <option value="글쓴이">글쓴이</option>
	</select>
	</div>
	
	
	
	<div class="col-md-3">
            <form action="./bbs.jsp" method="get">
                <div class="input-group">
                    <input class="form-control" id="system-search" name="search" placeholder="검색어" required>
                    <span class="input-group-btn">
                        <button type="submit"class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
        </div>
	
	</div>
	<div class="col-md-2"></div>
</div>	
	
	
	
</body>
</html>