<%@page import="pack_Reserve.ReserveRoomInfo"%>
<%@page import="pack_Reserve.ReserveRoomBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="pack_Reserve.ReserveBean"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="objDAO" class="pack_Reserve.ReserveMgr" scope="page"/>    
<%
String uId_Session = (String)session.getAttribute("s_Key"); 
String hCode = request.getParameter("hCode");

// 호텔 리스트 조회(호텔 Nav)
List<ReserveBean> objList = objDAO.mtd_hotelList();  
// 선택한 호텔의 방 리스트 조회(Calendar 내의 방 리스트)
List<ReserveRoomBean> objRoomList = objDAO.mtd_selRoomList(hCode);

// 선택한 호텔의 선택한 방의 예약 현황 확인
List<ReserveRoomInfo> objResvInfo = null;
/* for(int i=0; i<objList.size(); i++){
	int resvRoomCnt = objDAO.mtd_resvRoomInfo(hCode);
	out.print(hCode + "의 CNt" + resvRoomCnt);
} */


%>    

<%
Calendar cal = Calendar.getInstance();

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
  
}else{

}
//년도/월 셋팅
cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
//out.print("startDay : "+ startDay + " / endDay : " + endDay + " / start : "+start);
int newLine = 0;

//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));


%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
	<link rel="stylesheet" href="/style/style_main.css">
    <link rel="stylesheet" href="/style/style_Reserve.css">
    <script src="/script/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
    <script src="/script/script_Reserve.js"></script>
</head>
<body onload='pageLoading();'>
    <div id="wrap">
    	<input type="hidden" id="loginID" value="<%= uId_Session %>">
    	
    	<!--  헤더템플릿 시작, *********(각자)iframe으로 변경 필요, jsp include를 사용하면 비표준이 될 수 있음********* -->
		<%@ include file="/common/header.jsp"%>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main">
    		
   			<h1>예약 현황</h1>
   			
    		<!-- 호텔 메뉴 Area -->
    		<div id="hotelMenu">
   			
   				<ul id="hotelList" class="dFlex">
    		<% for(int i=0; i<objList.size(); i++){
    				ReserveBean objResvBean = objList.get(i);

    				if(i%10==0){
    					%>
    					</ul>
    					<ul class="dFlex">
    					<%
    				}
    			%>	
    				<li id="<%= objResvBean.gethCode() %>"><a href="/reserve/reserve.jsp?hCode=<%= objResvBean.gethCode() %>"><%= objResvBean.gethName() %></a></li>
    		<% } %>
    			</ul>
    		</div>
    		
    		<!-- 년, 월 및 달력 넘기기 표시 -->
    		<div id="nowMonthArea" class="dFlex">
    		
    			<div id="nowYearMonth">
	    			<!-- 이전해 -->
	    			<a href="<c:url value='/reserve/reserve.jsp' />?hCode=<%= hCode %>&amp;year=<%=year-1%>&amp;month=<%=month%>" target="_self">
						<b class="ltGtTxt">&lt;&lt;</b>
					</a>
					<!-- 이전달 -->
					<%
					String nowMonth1 = Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
					if(month > 0 ){ %>
					<a href="<c:url value='/reserve/reserve.jsp' />?hCode=<%= hCode %>&amp;year=<%=year%>&amp;month=<%=month-1%>" target="_self">
						<b class="ltGtTxt">&lt;</b>
					</a>
					<%} else {%>
					<a href="<c:url value='/reserve/reserve.jsp' />?hCode=<%= hCode %>&amp;year=<%=year-1%>&amp;month=11" target="_self">
						<b class="ltGtTxt">&lt;</b>
					</a>
					<%} %>
					
					&nbsp;&nbsp;
					<b class="yearTxt"><%=year%> 년</b>
					&nbsp;&nbsp;
					<b class="monthTxt"><%=nowMonth1%> 월</b>
					&nbsp;&nbsp;
					
					<!-- 다음달 -->
					<%if(month < 11 ){ %>
					<a href="<c:url value='/reserve/reserve.jsp' />?hCode=<%= hCode %>&amp;year=<%=year%>&amp;month=<%=month+1%>" target="_self">
						<b class="ltGtTxt">&gt;</b>
					</a>
					<%}else{%>
					<a href="<c:url value='/reserve/reserve.jsp' />?hCode=<%= hCode %>&amp;year=<%=year+1%>&amp;month=0" target="_self">
						<b class="ltGtTxt">&gt;</b>
					</a>
					<%} %>
					<!-- 다음해 -->
					<a href="<c:url value='/reserve/reserve.jsp' />?hCode=<%= hCode %>&amp;year=<%=year+1%>&amp;month=<%=month%>" target="_self">
						<b class="ltGtTxt">&gt;&gt;</b>
					</a>
    			</div>
				
				<div id="todayBtn">
					<input type="button" onclick="javascript:location.href='<c:url value='/reserve/reserve.jsp' />?hCode=<%= hCode %>'" value="today"/>				
				</div>
    		</div>
    		
    		<!-- 달력 Area -->
    		<div id="resvCal">
    		
<form name="calendarFrm" id="calendarFrm" action="" method="post">

	<div id="content" style="width:100%;">
		<!--날짜 네비게이션  -->
		
		<br>
		<table id="calResvArea" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
			<caption>회원정보 <b><%= uId_Session %></b> 님</caption>
			<thead>
				<tr bgcolor="#CECECE">
					<th width='180px'>객실구분</th>
					<th width='115px'><font color="red">일</font></th>
					<th width='115px'>월</th>
					<th width='115px'>화</th>
					<th width='115px'>수</th>
					<th width='115px'>목</th>
					<th width='115px'>금</th>
					<th width='115px'><font color="#529dbc">토</font></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class='leftTxt'>
						<br>
		
		  <%
		  for(int i=0; i<objRoomList.size(); i++){
			  ReserveRoomBean objResvBean = objRoomList.get(i);
		  %>
						  <span style="font-size:12px"><%= objResvBean.getrName() %></span>
						  <br>
		  <% } %>
		 			</th>	
		 <%
		//처음 빈공란 표시
		for(int index = 1; index < start ; index++ ) {
		  out.println("<TD >&nbsp;</TD>");
		  newLine++;
		}
		
		for(int index = 1; index <= endDay; index++) {
			String nowMonth = Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
			String nowDay = Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
			
			String resev_start = year+"-"+nowMonth+"-"+nowDay;
			String color = "";
			
			if(newLine == 0){			color = "RED";
			}else if(newLine == 6){ 	color = "#529dbc";
			}else{						color = "BLACK"; };
		
			String sUseDate = Integer.toString(year);
		
			sUseDate += nowMonth;
			sUseDate += nowDay;
		
			int iUseDate = Integer.parseInt(sUseDate);
			
			//out.print("year : "+ year + " / month : " + month + " / index : "+index);
			
			
			String backColor = "#fff";
			if(iUseDate == intToday ) {
				//out.print("intToday : "+intToday);	// 20220929
				//out.print("iUseDate : "+iUseDate);	// 20220929
				backColor = "#d7dbab";
			} 
			%>
			<td valign='top' align='left' height='100px' bgcolor='<%=backColor %>' nowrap>
				
					<b style="color:<%=color%>"><%=index %></b><br>
					
					<%
					for(int i=0; i<objRoomList.size(); i++){
						  ReserveRoomBean objResvBean = objRoomList.get(i);
						  
						  String rCode = objResvBean.getrCode();
						  // 총 객실 수와 예약한 객실 수 확인하여 남은 객실 수 확인
						  // 예약한 객실 수
						  objResvInfo = objDAO.mtd_resvCntInfo(rCode, resev_start);
						  int resCnt = objResvInfo.size();
						  // 총 객실 수 
						  int roomCnt = objDAO.mtd_roomCntInfo(rCode);
						  
						  // 오늘 이전 날짜라면 '예약마감' 표시
						  if(iUseDate < intToday){
							  %>
							  <span class="resvTxt">예약마감</span><br>
							  <%
						  }else {
							  if(resCnt == roomCnt){
								  %>
								  <span class="resvTxt">예약마감</span><br>
								  <%
							  } else {
								  %>
								  <button class="resvBtn" name="rCode" value="<%= objResvBean.getrCode() %>">예약하기(<%= roomCnt - resCnt %>/<%= roomCnt %>)</button>
								  <input type="hidden" class="resev_start" name="resev_start" value="<%= resev_start %>">
								  <input type="hidden" value="<%= hCode %>">
								  <br>
								  <%
							  }
						  }
					  }
					%>
			</td>
			<%
			newLine++;
		
			if(newLine == 7) {
			  out.println("</tr>");
			  if(index <= endDay) {
			      out.println("<tr>");
			  	  // 객실구분 td 공란 만들기
				  out.println("<th class='leftTxt'><br>");
			  	  
				  for(int i=0; i<objRoomList.size(); i++){
					  ReserveRoomBean objResvBean = objRoomList.get(i);
					  %>
					  <span style="font-size:12px" class="objResvBean.getrCode()"><%= objResvBean.getrName() %></span><br>
					  <%
				  }
			  	  
				  out.println("</th>");
			  }
			  newLine=0;
			}
		}
		//마지막 공란 LOOP
		while(newLine > 0 && newLine < 7) {
		  out.println("<td>&nbsp;</td>");
		  newLine++;
		}
		%>
		</tr>
		
		</tbody>
		</table>
	</div>
</form>
    		</div>
    		
    		<!-- 실제 작업 영역 끝 -->
    		
    		
    		    	
    	</main>
    	<!--  main#main  -->
    
        	   	
    	<!--  푸터템플릿 시작 -->
		<div id="footerWrap">
	
	       <%@ include file="/common/footer.jsp"%>
	    </div>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->

</body>
</html>