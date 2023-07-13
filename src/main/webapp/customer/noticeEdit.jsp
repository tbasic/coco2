<%@page import="customer.vo.Notice"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>noticeEdit.jsp</h3>

<form action="noticeEditProc.do" method="post">
<table class="twidth">
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col width="35%" />
	</colgroup>
	<caption>Edit</caption>
	<tbody>
	<tr>
		<th class="left">글번호</th>
		<td>${n.seq }</td>
		<th class="left">조회수</th>
		<td>${n.hit }</td>
		
	</tr>
	<tr>
		<th class="left">작성자</th>
		<td>${n.writer }</td>
		<th class="left">작성시간</th>
		<td>${n.regdate }</td>
		
	</tr>
	<tr>
		<th class="left">제목</th>
		<td colspan="3">
			<input type="text" class="inp" name="title" value="${n.title }" />
		</td>
			
	</tr>
	<tr>
		<th class="left">내용</th>
		<td colspan="3" id="content">
			<textarea name="content" class="txt">${n.content }</textarea>
		</td>
			
	</tr>
	<tr>
		<th class="left">첨부</th>
		<td colspan="3">첨부</td>			
	</tr>
	
	</tbody>
</table>
<input type="hidden" name="c" value="${n.seq }" />
<input type="submit" value="수정하기" />
<a href="noticeDetail.do?c=${n.seq }&h=${n.hit }">취소</a>

</form>

</h3>
</body>
</html>