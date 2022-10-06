<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="/style/style_main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script.js"></script>	
</head>
<body>
	
	<div id="wrap">
	
	<%@ include file="/common/header.jsp"%>
	
	   <!--  <header id="header" onclick="location.href='/bbs/write.jsp'">
	    	<img src="/images/header_img.png" width="100%" alt="예약이미">
		</header> -->
		
	    <!-- header#header -->
	    
	    
		<main id="main">
	    
			<div id="slideshowArea">
	                
	                
	                <div id="slideFrame">	                
	                
	                	
	                	<a href="#" data-no="1">   
	                		<img src="/images/bg_main01.jpeg" width="100%" alt="슬라이드1">
	                	</a>
	                	
	                	<a href="#" data-no="2">  
	                		<img src="/images/bg_main02.jpg" width="100%"  alt="슬라이드2">
	                	</a>
	                	
	                	<a href="#" data-no="3">  
	                		<img src="/images/bg_main06.png" width="100%" alt="슬라이드3">
	                	</a>
	                
	                </div>
	                <!-- div#slideFrame -->
	                
	            </div>
			<!-- #slideshowArea -->
	            
	        <div id="reserve" class="dFlex">
	        	<!-- <img src="/images/reserve.png" width="100%" alt="예약이미"> -->
	            <div>
	            	<h5>호텔 또는 도시</h5>
	            	<span>도시,명소,호텔을 입력하세요.</span>
	            </div>
	            
	            <div>
	            	<h5>체크인 / 체크아웃</h5>
	            	<span>2022.09.30 금 - 2022.10.01 토</span>
	            </div>
	            
	            <div class="people">
	            	<h5>객실수</h5>
	            	<span>1</span>
	            </div>
	            
	            <div class="people">
	            	<h5>성인</h5>
	            	<span>2</span>
	            </div>
	            
	            <div class="people">
	            	<h5>어린이</h5>
	            	<span>0</span>
	            </div>
	            
	            <div>
	            	<button onclick="location.href='/reserve/reserve.jsp?hCode=H01'">검색</button>
	            </div>
	            
			</div>
			<!-- #reserve -->
			
			
			<div id="contTitle" class="dFlex">
				<img src="/images/specialOffer.gif" alt="이미지01">
			</div>
			
			<div id="contents" class="dFlex">
			
			<div class="cont">
				<img src="/images/sub01.png" alt="이미지01">
				<h3>
					Autunm in the city
				</h3>
				<span>
					와인과 플래터를 함께 즐기는 서울 도심 속 여유로운<br>
					2022.09.20 - 2022.11.30
				</span>
			</div>
			
			<div class="cont">
				<img src="/images/sub02.png" alt="이미지01">
				<h3>
					Discover Your Autumn
				</h3>
				<span>
					올 가을 'diptyque'의 다섯 가지 향과 함께 당신의<br>
					2022.09.15 - 2022.11.30
				</span>
			</div>
			
			<div class="cont">
				<img src="/images/sub03.png" alt="이미지01">
				<h3>
					가을달밤 패키지
				</h3>
				<span>
					청량한 가을 햇살과 해운대 바다의 낭만이 흐르는<br>
					2022.09.20 - 2022.10.31
				</span>
			</div>
				
				
			</div>
			<!-- #contents -->
	
		</main>
		
		
	</div>
	<!-- div#wrap -->
	    
	    <div id="footerWrap">
	
	       <%@ include file="/common/footer.jsp"%>
	    </div>
		<!-- div#footerWrap -->
				
</body>
</html>