<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8"); 
String uId_Session = (String)session.getAttribute("uId_Session"); 
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>

<link rel="stylesheet" href="/style/style_bbs.css">
<script src="/script/jquery-3.6.0.min.js"></script>
<script src="/script/script.js"></script>
</head>

<body>
		<%@ include file="/common/header.jsp"%>
	<!-- header#header -->

	<div id="wrap" class="dFlex">
		<div id="Menu">
			<h2>고객센터</h2>
			<hr>
			<span onclick="location.href='/bbs/list.jsp'">Q&A</span><br> 
			<span onclick="location.href='/bbs/notice.jsp'">FAQ</span>
		</div>

		<main id="main" class="dFlex">


			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="bbsWrite">

				<h2>문의하기</h2>
				<hr>
				<form action="writeProc.jsp" enctype="multipart/form-data"
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

					<!-- 
					<div class="termArea">
						<span> [필수] 개인정보 수집 및 이용 동의 </span><br>
							<iframe src="/ind/personalInfoAgree.jsp" class="usingAgree"></iframe><br>
							<label>									
			    				<input type="checkbox" class="usingAgreeChk chkRequired" data-link="0"> 
			    				동의함	<br>		    					
			    			</label>				
					</div>	
					
					<div class="termArea">
						<span> [선택] 개인정보 수집 및 이용 동의</span><br>
							<iframe src="/ind/personalInfoAgree.jsp" class="usingAgree"></iframe><br>
							<label>									
			    				<input type="checkbox" class="usingAgreeChk chkRequired" data-link="1"> 
			    				동의함	<br>		    					
			    			</label>				
					</div>	
					 -->
					 <div id="btn">
						<button type="submit" id="regBtn">등록</button>
						<button type="button" id="regBtn" onclick="location.href='/bbs/list.jsp'">취소</button>
					</div>
				</form>
				
			</div>
			<!-- 실제 작업 영역 끝 -->

		</main>
		<!--  main#main  -->


		<!--  푸터템플릿 시작 -->

		<!--  푸터템플릿 끝 -->

	</div>
	<!-- div#wrap -->

</body>

</html>