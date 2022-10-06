<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr" scope="page" />


<jsp:useBean id="bean" class="pack_BBS.BoardBean" scope="session" />
<!-- Read.jsp에서 DB 에서 자료를 반환하여 session을 만들 때 세션이름을 "bean"으로,
       세션에 저장되는 값을 DB에서 반환된 자료를 setter로 저장한 BoardBean 객체를
       생성했었음 -->         
       
<jsp:useBean id="upBean" class="pack_BBS.BoardBean" scope="page" />
<!--  Update.jsp에서 form 요소의 하위요소에 입력된 값들을 전달받아서
        초기화시키기위해 생성되는 객체 -->
<jsp:setProperty name="upBean"  property="*" />
<!-- 전달되는 form하위요소의 매개변수 name 속성값과 
       BoardBean의 필드가 동일하면 서로 짝을 매치시켜서 필드에 초기화된다. -->      
   

<% 
request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("s_Key"); 

int num = Integer.parseInt(request.getParameter("num"));
int exeCnt = bMgr.updateBoard(num);
response.sendRedirect("/bbs/list.jsp");	

%>