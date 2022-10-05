<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%
request.setCharacterEncoding("UTF-8");

String takeit = request.getParameter("takeit");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/style/style_common.css">
<link rel="stylesheet" href="/style/style_userJoin.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_userJoin.js"></script>
<script src="https://kit.fontawesome.com/9a2dc8a1b1.js"></script>
</head>
<body>
		<%@ include file="/common/header.jsp"%>
	<div id="wrap" class="joinComplete">


		<ul id="progress" class="dFlex">
			<li class="complete"><span>약관 동의</span></li>
			<li class="complete"><span>정보 입력</span></li>
			<li class="check">가입 완료</li>
		</ul>
		
		<div id="contents">
		<img class="logo" src="/images/logo.png" alt="logo">
		<br>
		<i class="fa-solid fa-circle-check"></i>
		<br>
		<h1>회원가입 완료</h1>
		<p><%=takeit %>님의 회원가입이<br>성공적으로 완료되었습니다</p>
		<diV><img src="/images/dot.png" alt="dot">회원가입 내역 확인 및 수정은 <span>마이페이지</span>에서 가능합니다</div>
		<br>
		<button type="button" onclick="location.href='/login/login.jsp'">로그인하러가기</button>
		</div>
	</div>
	<!-- div#wrap -->
	
			<%@ include file="/common/footer.jsp"%>
	
</body>
</html>