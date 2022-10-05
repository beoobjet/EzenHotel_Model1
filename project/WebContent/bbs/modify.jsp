<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pack_BBS.*"%>
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));

String uId_Session = (String)session.getAttribute("uId_Session"); 

BoardBean bean = (BoardBean)session.getAttribute("bean");
String txtType = bean.getTxtType();
String subject = bean.getSubject();
String uName = bean.getuName();
String content = bean.getContent();
String systemFileName = bean.getSystemFileName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 수정</title>
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

				<form name="modifyFrm" action="modifyProc.jsp"
						method="get" id="modifyFrm">
						
					<table>
						<tbody>
							<tr>
								<th>문의유형</th>
								<td><%=txtType %></td>
							</tr>

							<tr>
								<th>이름</th>
								<td><%=uName %></td>
							</tr>

							<tr>
								<th>제목</th>
								<td><%=subject %></td>
							</tr>

							<tr>
								<th>내용</th>
								<td><%=content %></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><%=systemFileName %></td>
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
				
			</div>
		</main>

	</div>
	<!-- #wrap -->

</body>
</html>