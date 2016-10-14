<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="boardDB.boardDBDAO, boardDB.boardDBDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" scope="page" class="boardDB.boardDBDTO"/>
<%
String username = request.getParameter("username");
String passwd = request.getParameter("passwd");
String title = request.getParameter("title");
String memo = request.getParameter("memo");

//
board.setUsername(username);
board.setPasswd(passwd);
board.setTitle(title);
board.setMemo(memo);
board.setReg_time(new Timestamp(System.currentTimeMillis()));

//
boardDBDAO dao = boardDBDAO.getInstance();
dao.insertBoard(board);
//
response.sendRedirect("list.jsp");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>