<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.*" %>
    
 <%
ArrayList<BoardVo> alist =(ArrayList<BoardVo>) request.getAttribute("alist");
 PageMaker pm =(PageMaker)request.getAttribute("pm");

 
// out.print(alist);
 
%>

<%
int midx = 0;

//Session을 받을때는 값이 null로 올때를 생각해서 조건문을 사용한다.
if (session.getAttribute("midx") != null) {
  //세션의 값을 가져오기
  midx = (int)session.getAttribute("midx");
}
/* if (session.getAttribute("noitce").equals("Y")){
	
} */
%>

<%
if(session.getAttribute("midx")== null){
	session.setAttribute("saveUrl", request.getRequestURI());
	
	
	out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
}

%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ManagerPage</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<style>

  .button {
	background-color: powderblue;
	border: 1px solid powderblue;
	border-radius:6px;
	color: white;
	font-size: 1em;
	margin: 4px 4px;
	cursor: pointer;
	
	}
.MenuVar {text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
}

</style>
<script>
function notice(){
  	//alert("테스트");
  	
  	var fm = document.frm;
  	if (confirm("공지사항 넣을건가요?")) {
  	    // 확인 버튼 클릭 시 동작
  		fm.action = "<%=request.getContextPath()%>/member/memberManagerWriteAction.do";
		fm.method = "post";
		fm.submit();
  	    
  	}else{
  	    // 취소 버튼 클릭 시 동작
  	    alert("취소 되었습니다.");
  	    history.back();
  	   
  	}
  	  	
  		// 가상경로를 사용해서 페이지 이동시킨다
  		
	return;
}

function memberList() {
	location.href="<%=request.getContextPath()%>/member/memberList.do";
}
function memberManagerWrite(){
	location.href="<%=request.getContextPath()%>/member/memberManagerWrite.do";
}
function noticeList(){
	location.href="<%=request.getContextPath()%>/member/noticeList.do";
	
}
function warrning(){
	if(confirm("경고합니다. 그래도 확인버튼 누르시겠습니까?")){
	alert('장난입니다!');
	}else{
		alert('잘 생각하셨습니다.');
	}
}
</script>


</head>
<body style="background-color:#f9fbfc;">
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;"><strong>MAIN</strong></a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" >삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" >LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" >게시판</a>
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do">고객지원</a>
			<a href="<%=request.getContextPath() %>/pages/search.do">Google 검색</a>
			<%if (midx == 0) {%><a href="<%=request.getContextPath() %>/member/memberLogin.do" >로그인</a>
			<!--로그인 후 화면  --><%} 
								else if(session.getAttribute("manager_id").equals("Y")){%>
								<a href="<%=request.getContextPath() %>/member/memberMyPage.do">MyPage</a>
								<a href="<%=request.getContextPath()%>/member/memberManager.do"><strong>ManagerPage</strong></a>
								<a href="<%=request.getContextPath() %>/member/memberLogout.do">로그아웃</a>
								<%} else if (midx > 0) {%>
								<a href="<%=request.getContextPath() %>/member/memberMyPage.do"><strong>MyPage</strong></a>
								<a href="<%=request.getContextPath() %>/member/memberLogout.do">로그아웃</a><%} %>
	</div>
</div>
<hr>

<br>
<h3 style="margin-left:50px;">계정 </h3>
<hr>
<br>


<div style="margin-top:30px; margin-left:auto; margin-right:auto; width:1400px; vertical-align:center;">
	<div style="display:inline; float:left;">
				
			<div style=" border-radius:12px; border:solid 1px #CCC; font-size:2em;  width:400px; height:480px;">
				<p style="margin-left:50px; "><% if (session.getAttribute("midx") != null){
						out.println("<strong><mark>"+session.getAttribute("memberName")+"</mark></strong>님! <br> 안녕하세요! ");
				} %></p>
				<div style="text-align:center;">
					<img src="../image/apple2021wwdc01.jpeg" style="width:350px; height:250px; border-radius:12px; background-color:#fff;">
				</div>
			</div>
	</div>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:0; width:700px;">
			<div class="member_noticeWrite">
				<button style="padding:5px; width:700px; font-size:2em;" class="button" onclick="memberManagerWrite();">NoticeWrite</button>
			</div>
		</div>
	</div>
	<br>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:0; width:700px;">
			<div class="memberList">
				<button style="padding:5px; width:700px; font-size:2em;" class="button" onclick="memberList();">MemberList</button>
			</div>
		</div>
	</div>
	<br>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:0; width:700px;">
			<div class="memberList">
				<button style="padding:5px; width:700px; font-size:2em;" class="button" onclick="noticeList();">NoticeList</button>
			</div>
		</div>
	</div>
	<br>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:0; width:700px;">
			<div class="memberList">
				<button style="padding:5px; width:700px; font-size:2em;" class="button" onclick="warrning();">WARRNING</button>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>


<!-- 

<div style="text-align: center; margin-right:auto;">
	
	<button style="padding:5px; width:700px; font-size:1.5em;" class="button" onclick="memberManagerWrite();">공지사항 등록</button>
	<button style="padding:5px;" class="button" onclick="memberList();">회원리스트</button>
</div> -->



</body>
</html>






















