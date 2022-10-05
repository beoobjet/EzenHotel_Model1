<%@page import="pack_BBS.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr" scope="page" />
<%

request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("uId_Session"); 

try{
	
int num = Integer.parseInt(request.getParameter("num"));
int exeCnt = bMgr.deleteBoard(num);

} catch(Exception e){
	System.out.print("삭제되었습니다");
}
%>	
<script>
	alert("삭제되었습니다");
	location.href = "/bbs/list.jsp";
</script>