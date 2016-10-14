<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<% int num = Integer.parseInt(request.getParameter("num")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script.js">
<!--
function passwdCheck(){
	if(!document.passck.passwd.value){
		alert("비밀번호를 입력하십시오.");
		document.passck.passwd.focus();
		return;
	}
	document.passck.submit();
}
-->
</script>
</head>
<body>
	<table>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr align="center">
						<td>삭제</td>
					</tr>
				</table>
				<form name="passck" method="post" action="deletePro.jsp?num=<%=num %>" >
				<table>
					<tr>
						<td>&nbsp;</td>
						<td align="center">비밀번호</td>
						<td><input name="passwd" type="password" size="50" maxlength="100"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4"></td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2">
							<input type="submit" value="삭제" onclick="javascript:passwdCheck();"> 
							<input type=button value="취소" onclick="javascript:history.back(-1)">
						<td>&nbsp;</td>
					</tr>
				</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>