<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 <script type="text/javascript" src="script.js"></script>
 </head>
 <body>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr align="center">
      	<td>글쓰기</td>
     </tr>
    </table>
    <form name="writeform" method="post" action="writePro.jsp">
   <table>
     <tr>
      	<td>&nbsp;</td>
      	<td align="center">제목</td>
      	<td><input name="title" size="50" maxlength="100"></td>
      	<td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
     	<td>&nbsp;</td>
     	<td align="center">이름</td>
     	<td><input name="username" size="50" maxlength="50"></td>
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
     	<td><textarea name="memo" cols="50" rows="13"></textarea></td>
      	<td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
     	<td>&nbsp;</td>
     	<td colspan="2">
     		<input type="button" value="등록" onclick="checkForm(this.form)">
     		<input type="button" value="취소" onclick="javascript:history.back(-1)">
     	</td>
     </tr>
    </table>
    </form>
 </td>
 </tr>
 </table>
</body> 
</html>