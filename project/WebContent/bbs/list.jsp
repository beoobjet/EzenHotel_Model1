<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ page import="pack_BBS.BoardBean, java.util.Vector"%>
<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr" />

<%
request.setCharacterEncoding("UTF-8");

String s_Key = (String)session.getAttribute("s_Key"); 
Vector<BoardBean> vList = bMgr.BoardList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_bbs.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script_bbs.js"></script>
</head>
<body>
	
	<%@ include file="/common/header.jsp"%>
	

	<div id="wrap" class="dFlex">


		<div id="Menu">
			<h2>고객센터</h2>
			<hr>
			<span onclick="location.href='/bbs/list.jsp'">Q&A</span><br> <span
				onclick="location.href='/bbs/notice.jsp'">FAQ</span>
		</div>

		<main id="main" class="dFlex">

			<div id="contents" class="bbsWrite">
				<h2>Q&A</h2>
				<hr>
				<form>

					<table id="boardList">
						<tbody>
							<tr>
								<th>질문유형</th>
								<th>제목</th>
								<th>이름</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>

							<%
							for (int i = 0; i < vList.size(); i++) { //
								BoardBean objBean = vList.get(i);
							%>

								
							<tr id="readNum" class="readNum" value="<%=objBean.getNum()%>">
								<td><%=objBean.getTxtType()%></td>
								<td><%=objBean.getSubject()%></td>
								<td><%=objBean.getuName()%></td>
								<td><%=objBean.getRegTM()%></td>
								<td><%=objBean.getReadCnt()%></td>
							</tr>

							<%
							}
							%>
						</tbody>
					</table>
				</form>
			<div id="btn">
				<% if (s_Key == null) { %>
				<button id="loginAlertBtn" class="regBtn">문의하기</button>
				<% } else { %>
				<button id="writeBtn" class="regBtn">문의하기</button>
				<% } %>
			</div>
		</div>
		</main>
		</div>
		<div id="footerWrap">
	
	       <%@ include file="/common/footer.jsp"%>
	    </div>
		<!-- div#footerWrap -->
</body>
</html>