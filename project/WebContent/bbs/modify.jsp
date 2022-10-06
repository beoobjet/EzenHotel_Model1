<%@ page import="pack_BBS.BoardBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="pack_BBS.*"%>
<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr" scope="page" />

<% 

request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("s_Key"); 

try{
	int num = Integer.parseInt(request.getParameter("num"));
	int exeCnt = bMgr.updateBoard(num);
	
} catch(Exception e){
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 수정</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style_bbs.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script.js"></script>
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


			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="bbsWrite">

				<h2>문의글 수정</h2>
				<hr>
				<form action="modifyProc.jsp" enctype="multipart/form-data"
					method="post" id="writeFrm">
					<table>
						<tbody>
							<tr>
								<th>문의유형</th>
								<td><select name="txtType">
										<option>선택</option>
										<option value="예약문의">예약문의</option>
										<option value="기타">기타</option>
								</select></td>
							</tr>

							<tr>
								<th>이름</th>
								<td><input type="text" name="uName" maxlength="50"
									id="uName"></td>
							</tr>

							<tr>
								<th>제목</th>
								<td><input type="text" name="subject" maxlength="50"
									id="subject"></td>
							</tr>

							<tr>
								<th>내용</th>
								<td><textarea name="content" id="content" cols="60"
										wrap="hard"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><span class="spanFile"> <input type="file"
										name="fileName" id="fileName">
								</span></td>
							</tr>
						</tbody>
					</table>

					<div id="btn">
						<button type="submit" id="regBtn">수정</button>
						<button type="button" id="regBtn"
							onclick="location.href='/bbs/list.jsp'">취소</button>
					</div>
				</form>

			</div>

		</main>

	</div>
	<!-- div#wrap -->

<div id="footerWrap">
	
	       <%@ include file="/common/footer.jsp"%>
	    </div>
		<!-- div#footerWrap -->

</body>
</html>