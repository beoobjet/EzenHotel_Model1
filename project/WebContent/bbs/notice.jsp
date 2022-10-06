<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String uId_Session = (String)session.getAttribute("uId_Session"); 
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="/style/style_bbs.css">
<script src="/script/jquery-3.6.0.min.js"></script>
<script src="/script/script.js"></script>
</head>

<body>

		<%@ include file="/common/header.jsp"%>

	
    <div id="wrap" class="dFlex">
    	<div id="Menu">
			<h2>고객센터</h2>
			<hr>
			<span onclick="location.href='/bbs/list.jsp'">Q&A</span><br> 
			<span onclick="location.href='/bbs/notice.jsp'">FAQ</span>
		</div>
    	
    	<main id="main" class="dFlex">
    	
    		<div id="contents" class="bbsWrite">

				
				<h2>FAQ</h2>
				<hr>
				 
					<div class="multiTB all">
						<ul>
							<li id="faqHr" class="dFlex">
								<span id="faqHrType">구분</span>
								<span id="faqHrTitle">제목</span>
							</li>
						</ul>
					
						<ul>
							<li class="menu" id="room">
	                            <span class="faqType">객실</span>
	                            <span class="faqTitle">객실에서 인터넷을 사용할 수 있을까요?</span>
	                            <img src="/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu room">
	                            <span class="faqType">객실</span>
	                            <span class="faqTitle">체크인과 체크 아웃 시간은 언제입니까?</span>
	                            <img src="/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                         <li class="menu reserve">
	                            <span class="faqType" >예약</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu reserve">
	                            <span class="faqType">예약</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        
	                       <li class="menu etc">
	                            <span class="faqType">기타</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu etc">
	                            <span class="faqType">기타</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu etc">
	                            <span class="faqType">기타</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                    </ul>
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