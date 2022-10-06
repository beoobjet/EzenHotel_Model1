<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/style/style_hotelInfo.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8748a164bec19361e022336c9a56a682"></script>
</head>
<script src="/script/script_hotelInfo.js"></script>
<body>

	<%@ include file="/common/header.jsp"%>

	<div id="hotelInfoWrap">

		<div class="head">
			<h1>
				<i class="fa-solid fa-location-dot"></i>오시는 길
			</h1>
			<hr>
		</div>

		<section>
			<p>이젠 호텔로 오시는 길을 안내해 드립니다</p>
			<p>실내 수영장, 피트니스, 스크린골프 등 다양한 피트니스 시설을 갖춘 웰니스 센터에서는 전문적인 퍼스널 트레이닝
				시스템을 통해 스마트한 라이프 스타일을 경험하실 수 있으며, 도심 속 휴양지 어반 이스케이프에서는 도심 속 자연을 느끼며
				여유로운 휴식을 만끽하실 수 있습니다. 친환경, 스마트 그리고 럭셔리의 모든 가치를 겸비하고 있는 이젠 호텔은 여행과
				출장을 위해 방문한 모든 분들을 위한 최적의 공간입니다. 세심하고 품격 있는 서비스를 통해 고객 여러분의 모든 순간을
				특별한 순간으로 이루어드립니다.</p>
		</section>
		
		<div id="mapContainer">
			<ul id="directionList" class="dFlex">
				<li class="selectedMap">MATIE Osiria</li>
				<li>여수 벨메르</li>
				<li>브리드호텔 양</li>
				<li>더 플라자</li>
				<li>사이판</li>
				<li>설악 쏘라노</li>
				<li>거제 벨버디어</li>
				<li>경주</li>
				<li>대천 파로스</li>
				<li>산정호수 안시</li>
				<li>설악 별관</li>
				<li>용인 베잔송</li>
				<li>제주</li>
				<li>평창</li>
				<li>해운대</li>
				<li>백암온천</li>
			</ul>

			<div id="map" class="map"></div>
			
		</div>
		
		<div id="sideInfoContainer">
		
		<table>
			<caption>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</caption>
		</table>
		
		</div>

	</div>
	<!-- div#wrap -->

	<%@ include file="/common/footer.jsp"%>

</body>
</html>