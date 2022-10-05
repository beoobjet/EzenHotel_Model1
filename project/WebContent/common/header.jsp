<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%
request.setCharacterEncoding("UTF-8");
String isLogin = (String) session.getAttribute("s_Key");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script.js"></script>
<link rel="stylesheet" href="/style/style_common.css">
</head>
<body>
	<div id="headerWrap">
		<header id="header" class="dFlex">
			<div id="leftGNB">
			<ul class="dFlex">
				<li onclick="location.href='/hotelInfo/hotelInfo.jsp'">호텔소개</li>
				<li onclick="location.href='/bbs/list.jsp'">고객센터</li>
			</ul>
			</div>
			<div id="logoBox">
				<img src="/images/logo.png" alt="logo" onclick="location.href='/main.jsp'">
			</div>
			<div id="rightGNB">
			<ul class="dFlex">
			<%if (isLogin == null) { %>
				<li onclick="location.href='/reserve/reserve.jsp?hCode=H01'">예약하기</li>
				<li onclick="location.href='/join/join.jsp'">회원가입</li>
				<li>
				<button type="button" onclick="location.href='/login/login.jsp'">로그인</button>
				</li>
			<%} else { %>
				<li onclick="location.href='/reserve/reserve.jsp?hCode=H01'">예약확인</li>
				<li onclick="location.href='/logout/logout.jsp'">로그아웃</li>
				<li><button type="button" onclick="location.href='/userInfo/userEdit.jsp'">MY페이지</button>
				</li>
			<%} %>
			</ul>
			</div>

		</header>
	</div>
	<!-- div#wrap -->
</body>
</html>