<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pack_BBS.BoardBean, java.util.Vector"%>
<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr" />

<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
Vector<BoardBean> vList =  bMgr.mtd_read(num);

String uId_Session = (String)session.getAttribute("uId_Session"); 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_bbs.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>
	<header id="header" onclick="location.href='/bbs/write.jsp'">
		<img src="/images/header_img.png" width="100%" alt="예약이미지">
	</header>
	<!-- header#header -->

	<div id="wrap" class="dFlex">
		<div id="Menu">
			<h2>고객센터</h2>
			<hr>
			<span onclick="location.href='/bbs/list.jsp'">Q&A</span><br> 
			<span onclick="location.href='/bbs/notice.jsp'">FAQ</span>
		</div>

		<main id="main" class="dFlex">

			<div id="contents" class="bbsWrite">

				<h2>상세보기</h2>
				<hr>
				<%
				for (int i=0; i<vList.size(); i++) {		//
					BoardBean objBean = vList.get(i);
				%>

				<form>
					<table>
						<tbody>
							<tr>
								<th>문의유형</th>
								<td><%=objBean.getTxtType() %></td>
							</tr>

							<tr>
								<th>이름</th>
								<td><%=objBean.getuName() %></td>
							</tr>

							<tr>
								<th>제목</th>
								<td><%=objBean.getSubject() %></td>
							</tr>

							<tr>
								<th>내용</th>
								<td><%=objBean.getContent() %></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><%=objBean.getSystemFileName() %></td>
							</tr>
							
						</tbody>
					</table>
				</form>
				
				<div id="btn">
					<button id="regBtn" onclick="location.href='/bbs/write.jsp'">수정</button>
					<button id="regBtn" class="delBtn" value="<%=num%>"
					onclick="location.href='/bbs/deleteProc.jsp'">삭제</button>
					<button id="regBtn" onclick="location.href='/bbs/list.jsp'">목록</button>
				</div>
				<% } %>
			</div>
		</main>

	</div>
	<!-- #wrap -->

</body>
</html>