<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>

<jsp:useBean id="ULMgr" class="pack_Join.UserListMgr" />

<jsp:useBean id="uList" class="pack_Join.UserList" />
<jsp:setProperty name="uList" property="*" />

<%
request.setCharacterEncoding("UTF-8");

boolean isOK = ULMgr.mtd_Join(uList);

if (isOK == true) {
	response.sendRedirect("/join/joinComplete.jsp?takeit="+uList.getUid());
} else {
	%>
	<script>
	alert("가입 실패. 다시 시도해주세요");
	response.sendRedirect("/join/join.jsp");
	</script>
	<%
}

%>


