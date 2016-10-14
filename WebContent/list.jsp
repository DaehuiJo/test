<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="boardDB.boardDBDAO, boardDB.boardDBDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
 
<% request.setCharacterEncoding("utf-8"); %>

<%!
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판_list</title>
</head>
<body>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr height="5"><td width="5"></td></tr>
	<tr align="center">
		<td width="70">번호</td>
		<td width="380">제목</td>
		<td width="70">작성자</td>
		<td width="160">작성일</td>
		<td width="60">조회수</td>
	</tr>
	<%
	int count = 0;
	
	List<boardDBDTO> boardList = null;
	
	boardDBDAO board = boardDBDAO.getInstance();
	count = board.listCount();
	
	if(count==0){
		%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">등록된 글이 없습니다.</td>
		</tr>
		<%
	} else{
		boardList = board.getBoard();
		
		for(int i=0; i<boardList.size(); i++){
			boardDBDTO data = (boardDBDTO)boardList.get(i);
			%>
			<tr align="center" height="25">
				<td align="center"><a href="view.jsp?num=<%=data.getNum() %>"><%=data.getNum() %></a></td>
				<td align="center" ><%=data.getTitle() %></td>
				<td align="center"><%=data.getUsername() %></td>
				<td align="center"><%=sdf.format(data.getReg_time()) %></td>
				<td align="center"><%=data.getHit() %></td>
			</tr>
			<%
		}
	}
	
	%>
	
	<tr height="1" bgcolor="#020202"><td colspan="5"></td></tr>
	<tr height="1" bgcolor="#82B5DF"><td colspan="5" width="750"></td></tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr><td colspan="4" height="5"></td></tr>
	<tr align="center">
		<td><input type=button value="글쓰기" onclick="window.location='write.jsp'"></td>
	</tr>
</table>

</body>
</html>