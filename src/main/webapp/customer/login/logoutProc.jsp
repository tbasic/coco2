<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>logoutProc</h3>
<%
/* 세션제거 */
session.invalidate();
response.sendRedirect("loginForm.jsp");


%>

</body>
</html>