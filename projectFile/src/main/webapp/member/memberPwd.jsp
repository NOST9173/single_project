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
  <%@ page import="domain.*" %>
  <% MemberVo mv = (MemberVo)request.getAttribute("mv"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberId</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<script>

</script>
<style>

 	.button {
	
	background-color: powderblue;
	border: none;
	color: white;
	padding: 5px 15px;
	text-align: right;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 4px;
	cursor: pointer;
	}
	
option {
	text-align:right;
}
.MenuVar {text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
}

</style>

</head>
<body>
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" >삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" >LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" >게시판</a>
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do">고객지원</a>
			<a href="<%=request.getContextPath() %>/pages/search.do">Google 검색</a>
			<%if (midx == 0) {%><a href="<%=request.getContextPath() %>/member/memberLogin.do" >로그인</a>
			<!--로그인 후 화면  --><%} else if (midx > 0) {%>
								<a href="<%=request.getContextPath() %>/member/memberMyPage.do">MyPage</a>
								<a href="<%=request.getContextPath() %>/member/memberLogout.do">로그아웃</a>
								<%};%>
	</div>
</div>
<hr>

<br>

<form name="frm"> 

<div style="text-align:center;width:300px;height:200px;border-collapse:collapse;margin-top:200px; margin-left: auto; margin-right: auto; padding:20px 28px; ">
	<div style="padding:10px 0 10px 0;">
		<p>회원님의 비밀번호 </p>
		<span><%=
		mv.getMemberpwd()
		%></span>입니다.
			
	</div>
	<div style="display:inline;">
		<div class="button" style="width:300px; margin:0; text-align:center;display:inline;">
			<a href="<%=request.getContextPath() %>/member/memberLogin.do" style="padding:0;">로그인</a>
		</div>
		<div class="button" style="width:300px; margin:0; text-align:center;display:inline;">
			<a href="<%=request.getContextPath() %>/pages/index.do" style="padding:0;">메인</a>
		</div>
	</div>
</div>


</form>
</body>
</html>













