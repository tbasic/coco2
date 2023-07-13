<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>joinProc.jsp</h3>
<!-- 회원가입처리 -->
<%
request.setCharacterEncoding("utf8");
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");
String name=request.getParameter("name");
String gender=request.getParameter("gender");

String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String birth=String.format("%s-%s-%s", year,month,day);

String IsLunar=request.getParameter("IsLunar");
String cphone=request.getParameter("cphone");
String email=request.getParameter("email");

//String habit=request.getParameter("habit");
String[] habits=request.getParameterValues("habit");
String habit="";
if(habits!=null){
	for(int i=0;i<habits.length;i++){
		habit+=habits[i];
		if(habits.length>i+1)
			habit+=",";
	}
}

/* 에러 메시지전송 join.jsp로  */
/* 아이디 없음, 비번불일치 */
List<String> errors=new ArrayList();
if(id==null || id.equals("")){
	errors.add("아이디없음");
}
if(!pwd.equals(pwd2)){
	errors.add("비번불일치");
}
//에러가 1개라도 있으면 조건으로 분기
if(errors.size()>0){
	
	//request에 에러 보관
	request.setAttribute("errors", errors);
	//response.sendRedirect("join.jsp");
	request.getRequestDispatcher("join.jsp").forward(request, response);
	
}else{
	String sql="insert into member values("
			+"?,?,?,?,?,?,?,?,?,sysdate)";
			//dbcon
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="hr";
			String pw="123456";
			Connection con=DriverManager.getConnection(url,user,pw);

			//실행
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, birth);
			pstmt.setString(6, IsLunar);
			pstmt.setString(7, cphone);
			pstmt.setString(8, email);
			pstmt.setString(9, habit);

			//insert
			pstmt.executeUpdate();


			//메인페이지이동
			response.sendRedirect("../index.jsp");
}

%>


</body>
</html>