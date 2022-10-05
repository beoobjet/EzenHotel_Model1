<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
	
<jsp:useBean id="ULMgr" class="pack_Join.UserListMgr" />

<%
request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

boolean isOK = ULMgr.mtd_Login(uid, upw);

if(isOK) {
	session.setAttribute("s_Key", uid);
	response.sendRedirect("/main.jsp");
} else {
	response.sendRedirect("login.jsp?isOK=no");
}

%>
