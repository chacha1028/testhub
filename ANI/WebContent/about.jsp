<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv='Content-Type' content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximun-scale=1"> 
<link rel="stylesheet" href="css/bootstrap.css"> 
<link rel="stylesheet" href="css/custom.css"> 
<title>사이트 목적</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.bxslider.css">

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
		
		#wrapper{
			width:900px;
			margin:0 auto;
		}
		
		
		@media screen and (max-width:721px){
			#wrapper{
			width:420px;
			margin:0 auto;
			}		
	</style>

</head>
<body>

	<%
	
		String memberID = null;
		if(session.getAttribute("memberID") !=null) {
			memberID = (String) session.getAttribute("memberID");
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

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>동물, 사지말고 입양하세요!</h1>
				<P>피카츄라이추파이리꼬부기..<br>
				딱히쓸말이없다 뭐라쓰지</P>
				<a class="btn btn-warning btn-pull" href="bbs.jsp" role="button">동물친구들 만나러 가기♥</a>
			</div>
		</div>
	</div>


	<div id="wrapper">
		<div class="bxslider">
		<div>
			<img src="image/001.JPG" title="뚱땅뚱땅">
		</div>
		<div>
			<img src="image/002.JPG" title="이얏호응">
		</div>		
		<div>
			<img src="image/003.JPG" title="먀아">
		</div>	
		<div>
			<img src="image/004.jpg" title="기여운 금동이">
		</div>	
	</div>
	</div>



	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/jquery.bxslider.js"></script>
	
	<script>
	$(function(){
		var trigger = $('#trigger');
		var menu = $('nav ul');
		$(trigger).on('click',function(e){
			e.preventDefault();
			menu.slideToggle();
		});
		
		$(function(){
			$('.bxslider').bxSlider({
				
				captions:true,
				auto:true
			});
		});
		
		$(window).resize(function(){
			var w = $(window).width();
			if(w>320 && menu.is('hidden')){
				menu.removeAttr('stlye');
			}
		});
	});
	</script>
	
	
	
	
	
</body>
</html>