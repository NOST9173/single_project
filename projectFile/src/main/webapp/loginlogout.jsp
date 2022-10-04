<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int midx = 0;

//Session을 받을때는 값이 null로 올때를 생각해서 조건문을 사용한다.
if (session.getAttribute("midx") != null) {
  //세션의 값을 가져오기
  midx = (int)session.getAttribute("midx");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--로그인 전 화면  -->
<%if (midx == 0) {%>
  <ul>
    <li><a href="/member/memberJoin.jsp">회원가입</a></li>
    <li><a href="/member/memberLogin.jsp">로그인</a></li>
  </ul>

<!--로그인 후 화면  -->
<%} else if (midx > 0) {%>
  <ul>
    <li><a href="#">Mypage</a></li>
    <li><a href="#">계정설정</a></li>
    <li><a href="#">로그아웃</a></li>
  </ul>
<%};%>
</body>
</html>