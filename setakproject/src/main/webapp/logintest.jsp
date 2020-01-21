<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%session.setAttribute("id", request.getParameter("member_id")); %>    //파라미터를 받아서 세션값을 설정한다.
<%session.setAttribute("password", request.getParameter("member_password")); %>   
<html>
<head>
<title>Session Login</title>
</head>
<body>
    <h3>로그인 성공햇는데...</h3>
    <h3>Login ID : <%=(String)session.getAttribute("id") %></h3>   
    <h3>Login PASSWORD : <%=(String)session.getAttribute("password") %></h3> 
     <a href="profile1.do">회원정보 수정</a>
</body>
</html>
