<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<header id="header" onclick="location.href='/bbs/write.jsp'">
		<img src="/images/header_img.png" width="100%" alt="예약이미">
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

				
				<h2>FAQ</h2>
				<hr>
				
					<div id="tabBtn">
		                <button type="button" data-link="all">전체</button>
		                <button type="button" data-link="room">객실</button>
		                <button type="button" data-link="reserve">예약</button>
		                <button type="button" data-link="etc">기타</button>
	           		 </div>
					
					<table class="multiTB">
						<tbody>
							<tr class="room">
	                            <td>객실</td>
	                            <td>객실에서 인터넷을 사용할 수 있을까요?</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>
	                        <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                        
	                        <tr class="room">
	                        	<td>객실</td>
	                            <td>체크인과 체크아웃 시간은 언제입니까?</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>
	                        <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                       
	                        
	                        <tr class="room">
	                            <td>객실</td>
	                            <td>2020.03.14</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>
	                       <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                        
	                       
	                        <tr class="res">
	                            <td>예약</td>
	                            <td>객실 고객이 이용 가능한 부대시설은 어떤 것이 있나요?</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>	
	                        <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                        
	                        
	                        <tr class="res">
	                            <td>예약</td>
	                            <td>커넥팅 룸이 있나요?</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>
	                        <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                        
	                        <tr class="etc">
	                            <td>기타</td>
	                            <td>주차장 이용은 어떻게 할 수 있나요? (호텔 투숙객 전용 층이 있나요?)</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>
	                        <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                        
	                        	
	                        <tr class="etc">
	                            <td>기타</td>
	                            <td>지하철을 이용하는 경우 어떻게 찾아가나요?</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>	
	                        <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                        
	                        <tr class="etc">
	                            <td>기타</td>
	                            <td>코로나 방역을 위해 어떤 조치를 취하고 있나요?</td>
	                            <td class="btnIco"><img src="/images/ico_down.png" width="24px"></td>
	                        </tr>
	                        <tr class="reply">
	                      		<td colspan="3">답변</td>
	                        </tr>
	                        	
	                        	
						</tbody>
					</table>
				
			</div>
		</main>
	</div>
</body>
</html>