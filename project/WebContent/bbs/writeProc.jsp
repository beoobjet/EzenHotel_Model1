<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr" scope="page" />


<% 
request.setCharacterEncoding("UTF-8"); 
int rtnCnt = bMgr.bbsBoard(request);

String uId_Session = (String)session.getAttribute("s_Key"); 

if (rtnCnt ==1){
	response.sendRedirect("/bbs/list.jsp");	
} else{
	out.print("error");
}

%>