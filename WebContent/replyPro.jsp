<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="boardDB.boardDBDAO, boardDB.boardDBDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="reply" scope="page" class="boardDB.boardDBDTO"/>

<%
int num = Integer.parseInt(request.getParameter("num"));

boardDBDAO DAO = boardDBDAO.getInstance();
boardDBDTO DTO = DAO.getStep(num);

String username = request.getParameter("username");
String passwd = request.getParameter("passwd");
String memo = request.getParameter("memo");

reply.setUsername(username);
reply.setPasswd(passwd);
reply.setMemo(memo);
reply.setRef(DTO.getRef());
reply.setIndent(DTO.getIndent());
reply.setStep(DTO.getStep());
reply.setReg_time(new Timestamp(System.currentTimeMillis()));



response.sendRedirect("list.jsp");

%>
