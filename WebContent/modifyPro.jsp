<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="boardDB.boardDBDAO, boardDB.boardDBDTO" %>
<% request.setCharacterEncoding("utf-8"); %>

<% int num = Integer.parseInt(request.getParameter("num")); %>

<jsp:useBean id="content" class="boardDB.boardDBDTO">
	<jsp:setProperty name="content" property="*"/>
</jsp:useBean>

<%

boardDBDAO DAO = boardDBDAO.getInstance();
int check = DAO.update(content, num);

if (check==1){
	%>
	<meta http-equiv="Refresh" content="0;url=list.jsp">
	<%
} else{
	%>
	<script>
	<!--
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
	-->
	</script>
	<%
}
%>
