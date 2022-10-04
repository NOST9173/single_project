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
<title>customer support</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<style>


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
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do"><strong style="color:black;">고객지원</strong></a>
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
<br>
<br>
<table  style="text-align:left; border-collapse: collapse; margin-left: auto; margin-right: auto; width:1100px; height:900px; border-bottom:0px ">
<tr style="height:100px;">
<td ><strong><font size="20">무엇을 도와드릴까요?</font></strong></td>
</tr>
<tr style="height:400px;">
<td style="vertical-align:top">
<br><br><a href="mailto:beomjun9173@gmail.com"><font size="5">이메일 상담</font></a>
</td>
</tr>
<tr style="height:400px;">
<td style="vertical-align:top">
<font size="5"><a href="tel:010-1234-5678" style="text-align:left;">전화상담<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ↪010-1234-5678</a></font>
</td>
</tr>
</table>

</body>
</html>












