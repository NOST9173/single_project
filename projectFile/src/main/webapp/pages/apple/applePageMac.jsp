<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applePage Mac</title>
<link type="text/css" rel="stylesheet" href="default.css">
<style>


.MenuVar {postion: absolute; top:10px; right:40px; text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
	
}

#main {
	postion: absolute; top:10px; right:40px; text-align:center;
	border-bottom:1px solid powderblue;
	
}

.chapternav {
	list-style:none;
}

.chapternav-label {
	letter-spacing : 0em;
	
}
.chapternav-icon{
	width: 52px;
	height: 54px;
	background-size:52px 54px;
	background-repeat : no-repeat;
	background-image: url(./image/macbookair_light__f0o95rwae8ae_large.svg);
	margin:0 4px 0 20px;
}
.chapternav-items{
	display:inline;
	position: relative;
	height:100%;
	overflow-x:auto;
	overflow-y:hidden;
	white-space:nowrap;
}

.macbook-pro .chapternav-icon {
	width:84px;
	hieght:54px;
	background-size:84px 54px;
	background-repeat: no-repeat;
	background-image:url(./image/macbook_pro_light__e791sjqzt32a_large.svg)
}
.imac-24 .chapternav-icon {
	width:43px;
	height:54px;
	background-size:43px 54px;
	background-repeat:no-repeat;
	background-image:url(./image/imac_24_light__colyztscbeeu_large.svg)
}
.mac-mini .chapternav-icon {
	width:28px;
	height:54px;
	background-size:28px 54px;
	background-repeat:no-repeat;
	background-image:url(./image/mac_mini_light__frtahmzmd4mm_large.svg)
}
.mac-studio .chapternav-icon{
	width:28px;
	height:54px;
	background-size:28px 54px;
	background-repeat:no-repeat;
	backgruond-image:url(./image/mac_studio_light__ea3pb1auizu6_large.svg)
}
.mac-pro .chapternav-icon{
	width:35px;
	height:54px;
	background-size:35px 54px;
	background-repeat:no-repeat;
	background-image:url(./image/mac_pro_light__cj4dvg7thx5y_large.svg)
}
li {
	display:inline-block;
	
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
	<div class="chapternav">
		<ul class="chapternav-items">
			<li class="macbook-air"><a href="<%=request.getContextPath() %>/pages/applePageMacBookAir.jsp">
				<figure class="chapternav-icon"></figure>
				<span class="chapternav-label" role="text">MacBook Air</span></a></li>
			<li class="macbook-pro"><a href="">
				<figure class="chapternav-icon"></figure>
				<span class="chapternav-label" role="text">MacBook Pro</span></a></li>
			<li class="imac-24"><a href=""> 
				<figure class="chapternav-icon"></figure>
				<span class="chapternav-label" role="text">iMac 24</span></a></li>
			<li class="mac-mini"><a href="">
				<figure class="chapternav-icon"></figure>
				<span class="chapternav-label" role="text">Mac mini</span></a></li>
			<li class="mac-studio"><a href="">
				<figure class="chapternav-icon"></figure>
				<span class="chapternav-label" role="text">Mac Studio</span></a></li>
			<li class="mac-pro"><a href="">
				<figure class="chapternav-icon"></figure>
				<span class="chapternav-label" role="text">Mac Pro</span></a></li>
		</ul>
	
	</div>

</div>
</body>
</html>