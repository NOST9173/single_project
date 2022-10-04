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
<title>board pages</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<style>


.MenuVar { text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;	
}

</style>

</head>
<body style="background-color:black;">
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" >삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" >LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" style="color:white;"><strong>게시판</strong></a>
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

<div class="nav" style="border-bottom:1px solid #CCC; border-top:1px solid #CCC;">
	<div class="nav-button" style="text-align:center; padding:15px">
		<a href="<%=request.getContextPath() %>/a_board/boardList.do" style="padding:0px 10% 0px 10%">사용 팁</a>
		<a href="<%=request.getContextPath() %>/b_board/boardList.do" style="padding:0px 10% 0px 10%">구매 팁</a>
		<a href="<%=request.getContextPath() %>/c_board/boardList.do" style="padding:0px 10% 0px 10%">질문</a>
	</div>
</div>

<div style="background-color: #CCC; display:block;  width:1300px;height:900px; margin-left:auto; margin-right:auto; margin-top:30px;"> 
	<div>
		<img src="../image/apple2021wwdc.jpg" style="width:1300px;height:900px;">	
	</div>
</div>


</body>
</html>


















