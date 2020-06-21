<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width", initial-scale="1"> <%--부트스트랩 템플링 반응형 웹 메타템플릿 --%>
<link rel ="stylesheet" href="css/bootstrap.css"> <%--부트스트랩 css 롤더 참조  --%>
<title>로그인</title>


</head>
<body>
	<nav class="navbar navbar-default">
		
		<div class="collaspe navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인화면으로 돌아가기</a></li> 
			</ul>
		</div>
	</nav>
		
			
			<div class="col-lg-4"></div>
			
			<div class="col-lg-4">	
				<div class="jumbotron" style="padding-top:20px;">
					
					<form method="post" action="joinAction.jsp">
						<h3 style="text-align:center;">회원가입</h3>
						<div class="form-group">
						<label>아이디</label>
							<input type="text" class="form-control" placeholder="아이디" name="memberID" maxlength="20">
						</div>
						<div class="form-group">
						<label>비밀번호</label>
							<input type="password" class="form-control" placeholder="비밀번호" name="memberPassword" id="memberPassword" maxlength="20">
						</div>
						<div class="form-group">
						<label>비밀번호 확인</label>
							<input type="password" class="form-control" placeholder="비밀번호를 다시 한번 입력해주세요" name="memberPasswordCheck" id="memberPasswordCheck" maxlength="20">
						</div>
						<div class="form-group">
						<label>이름</label>
							<input type="text" class="form-control" placeholder="이름" name="memberName" maxlength="20">
						</div>
						
						
						<label>성별</label>
						<div class="form-group" style="text-align:center;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary">
								<input type="radio" name="memberGender" autocomplete="off" value="남자">남자</label>
							</div>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary">
								<input type="radio" name="memberGender" autocomplete="off" value="여자">여자</label>
							</div>
							</div>		
							
						<div class="form-group">
						<label>이메일</label>
							<input type="email" class="form-control" placeholder="이메일" name="memberEmail" maxlength="30">
						</div>

						
							<input type="submit" class="btn btn-primary form-control" value="회원가입">
					</form>
				</div>
			</div>
			<div class="col-lg-4"></div>
		
		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html> 



