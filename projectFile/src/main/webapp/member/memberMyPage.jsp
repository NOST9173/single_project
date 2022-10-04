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
<title>My Page</title>
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
function deleteMember(){
  	//alert("테스트");
  	
  	var fm = document.frm;
  	if (confirm("회원 탈퇴를 합니다. 탈퇴를 하시겠습니까?")) {
  	    // 확인 버튼 클릭 시 동작
  		alert("탈퇴 되었습니다.");
  		fm.action = "<%=request.getContextPath()%>/member/memberDeleteAction.do?midx=<%=session.getAttribute("midx")%>";
  		
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
 function modifyMember(){
	 var fm = document.frm;
	 if(confirm("회원 수정을 하겠습니까?")){
		 fm.action = "<%=request.getContextPath()%>/member/memberModifyAction.do?midx=<%=session.getAttribute("midx")%>";
		 fm.method = "post";
		 fm.submit();
	 }else{
		 alert("취소 되었습니다.");
		 history.back();
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
								<a href="<%=request.getContextPath() %>/member/memberMyPage.do"><strong>MyPage</strong></a>
								<a href="<%=request.getContextPath()%>/member/memberManager.do">ManagerPage</a>
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
					<img src="../image/apple2022wwdc.png" style="width:350px; height:250px; border-radius:12px; background-color:#fff;">
				</div>
			</div>
	</div>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:solid 1px #CCC; width:700px;">
			<div class="member_id">
				<p style="margin-left:50px;">
				<% if(session.getAttribute("midx") != null){
					out.println("<strong>아이디</strong> : "+session.getAttribute("memberId"));
				} %></p>
			</div>
		</div>
	</div>
	<br>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:solid 1px #CCC; width:700px;">
			<div class="member_email">
				<p style="margin-left:50px;">
				<% if(session.getAttribute("midx")!= null){
					out.println("<strong>이메일</strong> : "+session.getAttribute("memberEmail"));
				} %></p>
			</div>
		</div>
	</div>
	<br>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:solid 1px #CCC; width:700px;">
			<div class="member_phone">
				<p style="margin-left:50px;">
				<% if(session.getAttribute("midx")!=null){
					out.println("<strong>전화번호</strong> : "+session.getAttribute("memberPhone"));
				} %></p>
			</div>
		</div>
	</div>
	<br>
	<div style=" display:inline-block; font-size:1.5em; margin-left:50px; margin-bottom:50px;">
		<div style=" border-radius:12px;border:solid 1px #CCC; width:700px;">
			<div class="member_gender">
				<p style="margin-left:50px;">
				<% if(session.getAttribute("midx")!=null){
					out.println("<strong>성별</strong> : "+session.getAttribute("memberGender"));
				}
				%></p>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>

<form name="frm">

<div style="text-align: center; margin-right:auto;">
	<button style="padding:5px;" onclick="modifyMember();" class="button">회원수정</button>
	<button style="padding:5px;" onclick="deleteMember();" class="button">회원탈퇴</button>
</div>
</form>




<%-- <div style="text-align: left; border:1px solid #CCC; width:500px;">
	<div style="display:inline-block;">
		<a href="<%=request.getContextPath() %>/a_board/boardList.do"><span>사용 팁</span></a>
	</div>
	<div style="display:inline-block;">
		<a href="<%=request.getContextPath() %>/b_board/boardList.do"><span>구매 팁</span></a>
	</div>
	<div style="display:inline-block;">
		<a href="<%=request.getContextPath()%>/c_board/boardList.do"><span>질문</span></a>
	</div>
</div>
 --%>









<%-- 
<h3>계정 </h3>
<hr>
<br>

<div style="display:block; border-radius:12px;border:solid 1px #CCC; font-size:2em;  ">
	<p style="margin-left:50px;">
	<% if (session.getAttribute("midx") != null){
			out.println("<strong>"+session.getAttribute("memberName")+"</strong>님! <br> 안녕하세요. ");
	} %></p>
</div>
<br>
<br>
<br>
<h4>정보 </h4>
<hr>
<br>

<div style="display:block; border-radius:12px;border:solid 1px #CCC; ">
	<div class="member_id">
		<% if(session.getAttribute("midx") != null){
			out.println("<strong>아이디</strong> : "+session.getAttribute("memberId"));
		} %>
	</div>
	<div class="member_email">
		<% if(session.getAttribute("midx")!= null){
			out.println("<strong>이메일</strong> : "+session.getAttribute("memberEmail"));
		} %>
	</div>
	<div class="member_phone">
		<% if(session.getAttribute("midx")!=null){
			out.println("<strong>전화번호</strong> : "+session.getAttribute("memberPhone"));
		} %>
	</div>
	<div class="member_gender">
		<% 
		if(session.getAttribute("midx")!=null){
			out.println("<strong>성별</strong> : "+session.getAttribute("memberGender"));
		}
		%>
	</div>
</div>
 --%>

</body>
</html>






















