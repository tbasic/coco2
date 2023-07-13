<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function clearVal() {
	var inputVal=document.getElementById("q");
	inputVal.value="";
}
</script>
</head>
<body>
<h3>notice.jsp</h3>
<c:if test="${empty sessionScope.uid }">
	<a href="../login/login.do">login</a>  | 
	<a href="#">join</a>
</c:if>
<c:if test="${not empty sessionScope.uid }">
	<a href="../login/logoutProc.do">logout</a>
</c:if>

<form action="notice.do" method="get">
	<select name="f">
		<option value="title" ${param.f=="title"?"selected":"" }>제목</option>
		<option value="content" ${param.f=="content"?"selected":"" }>내용</option>
		
	</select>
	<input type="text" name="q" value="${query }" id="q" onclick="clearVal()" />
	<input type="submit" value="검색" />
</form>


<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>	
	</tr>

<c:forEach items="${list }" var="n">
	<tr>
		<td>${n.seq }</td>
		<td><a href="noticeDetail.do?c=${n.seq }&h=${n.hit }">${n.title }</a></td>
		<td>${n.writer }</td>
		<td>${n.regdate }</td>
		<td>${n.hit }</td>	
	</tr>
</c:forEach>	

</table>

<c:if test="${not empty sessionScope.uid }">
	<a href="noticeReg.do">글쓰기</a>
</c:if>
</body>
</html>

