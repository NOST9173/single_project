<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Dbconn.Dbconn" %>
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
<title>Main Page</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<script src="/project/js/jquery-3.6.0.min.js"></script>
<style>

/*GLOBALS*/
* {
   
    padding: 0;
    list-style: none;
}

#slider-wrap {
    width: 80%; 
    height: 800px;
    position: relative;
    overflow: hidden;
    margin-left: auto; margin-right: auto;
}

#slider-wrap ul#slider {
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
}

#slider-wrap ul#slider li {
    float: left;
    position: relative;
    width: 1400px;
    height:800px;
}

#slider-wrap ul#slider li>div {
    position: absolute;
    top: 20px;
    left: 35px;
}

#slider-wrap ul#slider li>div h3 {
    font-size: 36px;
    text-transform: uppercase;
}

#slider-wrap ul#slider li>div span {
    font-size: 21px;
}

#slider-wrap ul#slider li img {
    display: block;
    width: 100%;
    height: 100%;
}

/*btns*/
.slider-btns {
    position: absolute;
    width: 50px;
    height: 60px;
    top: 50%;
    margin-top: -25px;
    line-height: 57px;
    text-align: center;
    cursor: pointer;
    background: rgba(0, 0, 0, 0.1);
    z-index: 100;
    -webkit-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -ms-user-select: none;
    -webkit-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.slider-btns:hover {
    background: rgba(0, 0, 0, 0.3);
}

#next {
    right: -50px;
    border-radius: 7px 0px 0px 7px;
    color: #eee;
}

#previous {
    left: -50px;
    border-radius: 0px 7px 7px 7px;
    color: #eee;
}

#slider-wrap.active #next {
    right: 0px;
}

#slider-wrap.active #previous {
    left: 0px;
}

/* -5월27일부터 다시   */

.MenuVar {display:inline-block; text-align:center;
		
	}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
	
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

<body style="background-color:black; ">

<%-- <%
	//객체 생성 
	Dbconn dbconn = new Dbconn();
	System.out.println("dbconn"+dbconn);
%> --%>
<div id="header" style="text-align:center;" >
	<div class="MenuVar"  >
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;"><strong>MAIN</strong></a>
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

<div id="main">
	<div id="slider-wrap">
	    <ul id="slider">
	        <li>
	            <div>
	                <h3 style="color:#CCC;">apple</h3>
	                <span style="color:#CCC">MacBookAir</span>
	            </div>
	            <a href="https://www.apple.com/kr/macbook-air/">
	            <img src="./image/macbookair.png"></a>
	        </li>
	        <li>
	            <div>
	                <h3 style="color:black;">apple</h3>
	                <span style="color:black;">MacBookPro</span>
	            </div>
	            <a href="https://www.apple.com/kr/macbook-pro/">
	            <img src="./image/macbookpro.png"></a>
	        </li>
	        <li>
	            <div>
	                <h3 style="color:black;">apple</h3>
	                <span style="color:black;">iPhone13Pro</span>
	            </div>
	            <a href="https://www.apple.com/kr/iphone-13-pro/">
	            <img src="./image/iPhone13.png"></a>
	        </li>
	        <li>
	            <div>
	                <h3 style="color:black;">apple</h3>
	                <span style="color:black;">AirpodsMAX</span>
	            </div>
	            <a href="https://www.apple.com/kr/airpods-max/">
	            <img src="./image/airpodsmax.png"></a>
	        </li>
	
	        <li>
	            <div>
	                <h3>samsung</h3>
	                <span>galaxy book2</span>
	            </div>
	            <a href="https://www.samsung.com/sec/pc/galaxybook/">
	            <img src="./image/samsungImage.PNG"></a>
	        </li>
	
	        <li>
	            <div>
	                <h3 style="color:#CCC;">LG</h3>
	                <span style="color:#CCC;">LG360 모니터 </span>
	            </div>
	            <a href="https://www.lge.co.kr/monitors">
	            <img src="./image/lg360.png"></a>
	        </li>
	
	    </ul>
	
	    <div class="slider-btns" id="next"><span>▶</span></div>
	    <div class="slider-btns" id="previous"><span>◀</span></div>
	
	    <div id="slider-pagination-wrap">
	        <ul>
	        </ul>
	    </div>
	</div>
</div>	

<br>
<div style="text-align:center;">
	<a href="https://www.apple.com/kr/macbook-air/">
	<img src="./image/macbookair.png" style="width:80%; height:;"></a>
</div>
	
<div style="text-align:center;">
	<a href="https://www.apple.com/kr/iphone-13-pro/">
	<img src="./image/iPhone13.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.apple.com/kr/ipad-pro/">
	<img src="./image/ipadpro.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.samsung.com/sec/smartphones/galaxy-s/">
	<img src="./image/ultra22_1.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.samsung.com/sec/pc/galaxybook/">
	<img src="./image/book2pro.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.samsung.com/sec/tablets/galaxy-tabs/">
	<img src="./image/tab_s8.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.samsung.com/sec/watches/galaxy-watch">
	<img src="./image/watch4.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.lge.co.kr/notebook">
	<img src="./image/lgGram01.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.lge.co.kr/notebook">
	<img src="./image/lgGram02.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.lge.co.kr/monitors">
	<img src="./image/lg360.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.lge.co.kr/monitors">
	<img src="./image/ultrawide01.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.lge.co.kr/ultragear">
	<img src="./image/ultragear01.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.lge.co.kr/all-in-one-pc-and-desktop">
	<img src="./image/lgallinone.png" style="width:80%; height:;"></a>
</div>
<div style="text-align:center;">
	<a href="https://www.lge.co.kr/robots">
	<img src="./image/lgrobots.png" style="width:80%; height:;"></a>
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

<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!-- 회원 리스트와 로그아웃   -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->



	<%-- 
	
	
	<a href="<%=request.getContextPath() %>/member/memberList.do" class="btton">회원 리스트</a>
	
	<%
	if(session.getAttribute("midx") != null){
		out.println("회원 아이디 : "+session.getAttribute("memberId")+"<br>");
		out.println("회원 이름 : "+session.getAttribute("memberName")+"<br>");
		
		out.println("<a href='"+request.getContextPath()+"/member/memberLogout.do'>로그아웃</a>");
		
		
	}
%>
	 --%>
<!--  -->	
<!--  -->	
<!--  -->	
<!-- 슬라이드 스크립트  -->
<!--  -->
<!--  -->
<!--  -->
<script>
//slide-wrap
var slideWrapper = document.getElementById('slider-wrap');
//current slideIndexition
var slideIndex = 0;
//items
var slides = document.querySelectorAll('#slider-wrap ul li');
//number of slides
var totalSlides = slides.length;
//get the slide width
var sliderWidth = slideWrapper.clientWidth;
//set width of items
slides.forEach(function (element) {
    element.style.width = sliderWidth + 'px';
})
//set width to be 'x' times the number of slides
var slider = document.querySelector('#slider-wrap ul#slider');
slider.style.width = sliderWidth * totalSlides + 'px';

// next, prev
var nextBtn = document.getElementById('next');
var prevBtn = document.getElementById('previous');
nextBtn.addEventListener('click', function () {
    plusSlides(1);
});
prevBtn.addEventListener('click', function () {
    plusSlides(-1);
});

// hover
slideWrapper.addEventListener('mouseover', function () {
    this.classList.add('active');
    clearInterval(autoSlider);
});
slideWrapper.addEventListener('mouseleave', function () {
    this.classList.remove('active');
    autoSlider = setInterval(function () {
        plusSlides(1);
    }, 2000);
});


function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlides(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    slideIndex = n;
    if (slideIndex == -1) {
        slideIndex = totalSlides - 1;
    } else if (slideIndex === totalSlides) {
        slideIndex = 0;
    }

    slider.style.left = -(sliderWidth * slideIndex) + 'px';
    pagination();
}

//pagination
slides.forEach(function () {
    var li = document.createElement('li');
    document.querySelector('#slider-pagination-wrap ul').appendChild(li);
})

function pagination() {
    var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
    dots.forEach(function (element) {
        element.classList.remove('active');
    });
    dots[slideIndex].classList.add('active');
}

pagination();
var autoSlider = setInterval(function () {
    plusSlides(1);
}, 2000);

</script>


   

</body>
</html>












