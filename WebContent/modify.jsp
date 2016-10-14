<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="boardDB.boardDBDAO, boardDB.boardDBDTO" %>

<%
int num = Integer.parseInt(request.getParameter("num")); 

boardDBDAO DAO = boardDBDAO.getInstance();
boardDBDTO DTO = DAO.modifyCheck(num);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr align="center">
      <td height="30">수정</td>
     </tr>
    </table>
    <form name="modify" method="post" action="modifyPro.jsp?num=<%=num %>">
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td>
      	<input name="title" size="50" maxlength="100" value="<%=DTO.getTitle() %>">
      	<input type="hidden" name="num" value="<%=num %>">
      </td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><%=DTO.getUsername() %><input type="hidden" name="username" size="50" maxlength="50" value="<%=DTO.getUsername() %>"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="passwd" type="password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"><%=DTO.getMemo() %></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      	<input type="button" value="수정" onclick="modifyCheck(this.form)">
       	<input type="button" value="취소" onclick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
    </form>
   </td>
  </tr>
 </table>
</body> 
</html>