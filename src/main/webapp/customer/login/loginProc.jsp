<%@page import="java.sql.ResultSet"%>
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
<h3>loginProc.jsp</h3>

<%
request.setCharacterEncoding("utf8");
String id=request.getParameter("id");
String pass=request.getParameter("password");

String sql="select pwd from member where id=?";
//dbcon
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url,user,pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();

//로그인 경우의 수
String ypass="";
int x=-1;
String msg="";

if(rs.next()){
	ypass=rs.getString("pwd");
	if(ypass.equals(pass))
		x=1;//로그인성공
	else
		x=0;//pass불일치
			
}else{
	x=-1;//아이디 없음
}
 System.out.print("xxxxx : "+x);
 //x값에 따라서 msg라는 파람값을 다이나믹하게 전달
 if(x==1){//성공
	 session.setAttribute("sesionID", id);
	 msg="../mainForm.jsp";
 }else if(x==0){//실패 //pass불일치
	 msg="./loginForm.jsp?msg=0";
 }else{//실패 //아이디 없음
	 msg="./loginForm.jsp?msg=-1";
 }

 response.sendRedirect(msg);

%>

</body>
</html>







