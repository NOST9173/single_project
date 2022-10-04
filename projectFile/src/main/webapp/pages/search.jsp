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
<link type="text/css" rel="stylesheet" href="../css/default.css">
<title>search</title>
<style>

.MenuVar {text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
}


/*  검색바 css  */
.search {
	position : relative;
	width: 80%;
}

input {
	
	border : 1px solid #CCC;
	border-radius:8px;
	padding : 10px 12px;
	font-size: 14px;
}
img {
	position : absolute;
	width: 17px;
	top:10px;
	right:12px;
	margin:0;
}
body{
	background-image:url('../image/banner.jpg');
	background-repeat: no-repeat;
	background-position: top center;
}
.search_icon {

}
</style>

</head>
<body style="background-color:powderblue;">
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" >삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" >LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" >게시판</a>
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do">고객지원</a>
			<a href="<%=request.getContextPath() %>/pages/search.do"><strong style="color:black;">Google 검색</strong></a>
			<%if (midx == 0) {%><a href="<%=request.getContextPath() %>/member/memberLogin.do" >로그인</a>
			<!--로그인 후 화면  --><%} else if (midx > 0) {%>
								<a href="<%=request.getContextPath() %>/member/memberMyPage.do">MyPage</a>
								<a href="<%=request.getContextPath() %>/member/memberLogout.do">로그아웃</a>
								<%};%>
	</div>
</div>
<hr>

<!--  검색창   -->
<%-- <form method=get action="http://www.google.co.kr/search" target="_blank" style="">
<div class="search" style="margin-right:auto; margin-left:auto; margin-top:150px; ">
	<input type="text" placeholder="검색어 입력" maxlength=255 style="width : 90%;">
	<input type=submit class="search_icon" style="width:20px;height:25px;"/>
</div>
<div style="">
	
</div>
</form>

<form method="post" action="<%=request.getContextPath()%>  ">


</form>
 --%>
 
 
<!-- Search Google -->
<form method=get action="http://www.google.co.kr/search" target="_blank" style="margin-top:10%;">
  <div  style="margin-right:10%; margin-left:10%;">
	<div style=" width:80%; margin-left:20%;"> 
		<div style="">
			<input type=text name=q size=100 maxlength=255 value=""/> <!-- 구글 검색 입력 창 -->
			<input type=submit name=btnG value="Google 검색" style="background-color: #CCC; color:white; cursor: pointer;"/> <!-- 검색 버튼 -->
		</div>
	</div>     
  </div>
</form>



<!-- Search Google -->

</body>
</html>




















