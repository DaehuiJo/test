<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "boardDB.boardDBDAO"%>
<% request.setCharacterEncoding("utf-8");  %>

<%
int num = Integer.parseInt(request.getParameter("num"));
String passwd = request.getParameter("passwd");


boardDBDAO DAO = boardDBDAO.getInstance();

int check = DAO.deleteCheck(num, passwd);

if(check==1){
	response.sendRedirect("list.jsp");
} if(check==-1){
	%>
	<script type="text/javascript">
	<!--
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
	-->
	</script>
	<%
}

%>
