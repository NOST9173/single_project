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
<title>apple page</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<script src="/project/js/jquery-3.6.0.min.js"></script>
<style>


.MenuVar {display:inline-block; text-align:center;
		}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;	
	
}
#header {
text-align:center;
	
}
#main {
	text-align:center;
	border-bottom:1px solid powderblue;
		padding:0 4% 0 4%;	
	
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
<body style="background-color:black;">
<div id="header" >
	<div class="MenuVar"  >
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do"><strong style="color:white;">애플</strong></a>
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

<div id="main">
	<div class="chapternav">
		<ul class="chapternav-items">
			<li class="mac"><a href="https://www.apple.com/kr/mac/" target="block;">
				<span class="chapternav-label" role="text">Mac</span></a></li>
			<li class="ipad"><a href="https://www.apple.com/kr/ipad/" target="block;">
				<span class="chapternav-label" role="text">iPad</span></a></li>
			<li class="iphone"><a href="https://www.apple.com/kr/iphone/" target="block;"> 
				<span class="chapternav-label" role="text">iPhone</span></a></li>
			<li class="watch"><a href="https://www.apple.com/kr/watch/" target="block;">
				<span class="chapternav-label" role="text">Watch</span></a></li>
			<li class="airpods"><a href="https://www.apple.com/kr/airpods/" target="block;">
				<span class="chapternav-label" role="text">AirPods</span></a></li>
			<li class="accessory"><a href="https://www.apple.com/kr/shop/accessories/all" target="block;">
				<span class="chapternav-label" role="text">액세서리</span></a></li>
		</ul>
	
	</div>

	<br>

<div class="mac">
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/macbook-air/" target="block;">
		<img src="../image/macbookair.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/macbook-pro/" target="block;">
		<img src="../image/macbookpro.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/imac-24/">
		<img src="../image/imac.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/mac-mini/" target="block;">
		<img src="../image/macmini.png" style="width:80%; height:;"></a>
	</div>
</div>
<div class="iphone">	
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/iphone-13-pro/" target="block;">
		<img src="../image/iPhone13.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/iphone-se/" target="block;">
		<img src="../image/iphonese3.png" style="width:80%; height:;"></a>
	</div>
</div>

<div class="ipad">
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/ipad-pro/" target="block;">
		<img src="../image/ipadpro.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/ipad-air/" target="block;">
		<img src="../image/ipadair.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/ipad-mini/" target="block;">
		<img src="../image/ipadmini.png" style="width:80%; height:;"></a>
	</div>
</div>

<div class="applwatch">
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/watch/" target="block;">
		<img src="../image/applewatch.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/apple-watch-nike/" target="block;">
		<img src="../image/AppleWatchNike.png" style="width:80%; height:;"></a>
	</div>
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/apple-watch-hermes/" target="block;">
		<img src="../image/AppleWatchHermes.png" style="width:80%; height:;"></a>
	</div>
</div>

<div class="airpods">
	<div style="text-align:center;">
		<a href="https://www.apple.com/kr/airpods-max/" target="block;">
		<img src="../image/airpodsmax.png" style="width:80%; height:;"></a>
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

</div>
</body>
</html>












