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
<title>samsung page</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<script src="/project/js/jquery-3.6.0.min.js"></script>
<style>

.MenuVar {text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
}
#main {
	text-align:center;
	border-bottom:1px solid powderblue;
	
	
}

.chapternav {
	list-style:none;
	background-color:;
}

.chapternav-label {
	letter-spacing : 0em;
	
}
.chapternav-items{
	display:inline;
	position: relative;
	height:100%;
	overflow-x:auto;
	overflow-y:hidden;
	white-space:nowrap;
}

li {
	display:inline-block;
	
}

/* 상단으로 올라가는 버튼 CSS */
.moveTopBtn {
	position : fixed;
	bottom: 1rem;
	right: 1rem;
	width: 4rem;
	height: 4rem;
	background: #CCC;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border-radius:50%;
	
}

</style>

</head>
<body>
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" ><strong style="color:black;">삼성</strong></a>
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

<div id="main">
	<div class="chapternav">
		<ul class="chapternav-items">
			<li class="mac"><a href="https://www.samsung.com/sec/smartphones/galaxy-s/" target="block;">
				<span class="chapternav-label" role="text">스마트폰</span></a></li>
			<li class="ipad"><a href="https://www.samsung.com/sec/tablets/galaxy-tabs/" target="block;">
				<span class="chapternav-label" role="text">태블릿 </span></a></li>
			<li class="iphone"><a href="https://www.samsung.com/sec/pc/galaxybook/" target="block;"> 
				<span class="chapternav-label" role="text">갤럭시 북 </span></a></li>
			<li class="watch"><a href="https://www.samsung.com/sec/watches/galaxy-watch/" target="block;">
				<span class="chapternav-label" role="text">갤럭시 워치</span></a></li>
			<li class="airpods"><a href="https://www.samsung.com/sec/buds/galaxy-buds2/" target="block;">
				<span class="chapternav-label" role="text">갤럭시 버즈</span></a></li>
			<li class="accessory"><a href="https://www.samsung.com/sec/mobile-accessories/all-mobile-accessories/" target="block;">
				<span class="chapternav-label" role="text">액세서리</span></a></li>
		</ul>
	
	</div>
	<br>
 
<div class="galaxy">
	<div style="text-align:center;">
		<a href="https://www.samsung.com/sec/smartphones/galaxy-s/" target="block;">
		<img src="../image/ultra22_1.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.samsung.com/sec/tablets/galaxy-tabs/" target="block;">
		<img src="../image/tab_s8.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.samsung.com/sec/pc/galaxybook/">
		<img src="../image/book2pro.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.samsung.com/sec/watches/galaxy-watch" target="block;">
		<img src="../image/watch4.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.samsung.com/sec/buds/galaxy-buds2/" target="block;">
		<img src="../image/buds2.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.samsung.com/sec/mobile-accessories/all-mobile-accessories/" target="block;">
		<img src="../image/ultra22.png" style="width:80%; height:;"></a>
	</div>
</div>
</div>

<!-- 우측 하단 상단으로 올라가는 버튼  -->
<div class="moveTopBtn" style="">TOP</div>


<!-- 우측 하단 상단으로 올라가는 버튼  -->
<script>
	const $topBtn = document.querySelector("*.moveTopBtn");
	
	// 버튼 클릭 시 맨 위로 이동 
	$topBtn.onclick = ()=> {
		  window.scrollTo({ top: 0, behavior: "smooth" });  
	}
</script>
</body>
</html>













