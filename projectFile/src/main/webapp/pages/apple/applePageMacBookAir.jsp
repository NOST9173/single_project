<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applePage MacBookAir</title>
<link type="text/css" rel="stylesheet" href="default.css">
<style>
body{
	background-color:black;
}

.MenuVar {postion: absolute; top:10px; right:40px; text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
}

#main{
	margin-left: auto;
	margin-right: auto;
	width:980px;
}

</style>

</head>
<body>
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do"><strong>애플</strong></a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" >삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" >LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" >게시판</a>
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do">고객지원</a>
			<a href="<%=request.getContextPath() %>/pages/search.do">검색</a>
			<a href="<%=request.getContextPath() %>/member/memberLogin.do" >로그인</a>
	</div>
</div>
<hr>


<div id="main">
	


</div>
</body>
</html>