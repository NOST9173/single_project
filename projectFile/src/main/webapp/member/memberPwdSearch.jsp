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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberIdSearch</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<script>
function check(){
//		alert("테스트");
		
		var fm = document.frm;
		
		if (fm.memberName.value == ""){
	  		alert("이름을 입력하세요");  		
	  		fm.memberName.focus();
	  		return;
	  	}else if (fm.memberPhone.value == ""){
	  		alert("연락처를 입력하세요");  		
	  		fm.memberPhone.focus();
	  		return;
	  	}else if(isNaN(fm.memberPhone.value)){
	  		alert("연락처는 - 제외한 숫자만 입력해주세요.");
	  		fm.memberPhone.focus();
	  		return false;
	  		
	  	} else if (fm.memberEmail.value == ""){
	  		alert("이메일을 입력하세요");  		
	  		fm.memberEmail.focus();
	  		return;
	  	}
  	
  		// 가상경로를 사용해서 페이지 이동시킨다
  	//	fm.action = "./memberJoinOk.jsp";
  		fm.action = "<%=request.getContextPath()%>/member/memberPwdSearchAction.do";
  		fm.method = "post";
  		fm.submit();
   return;
	
}
</script>
<style>

 	.button {
	
	background-color: powderblue;
	border: none;
	color: white;
	padding: 5px 15px;
	text-align: right;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 4px;
	cursor: pointer;
	}
	
option {
	text-align:right;
}
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

<br>




<form name="frm"> 


<div style="text-align:center;width:300px;height:200px;border-collapse: collapse;margin-top:200px; margin-left: auto; margin-right: auto; padding:20px 28px; ">
	
	<div style="padding:10px 0 10px 0;">
		<div style="padding:10px 0 10px 0;">
			<input type="text" name="memberId" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="아이디를 입력" maxlength="20" style="text-align:center;">
		</div>
		<div style="padding:10px 0 10px 0;">
			<input type="text" name="memberName" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="이름을 입력" maxlength="15" style="text-align:center;">
		</div>
		<div  style="padding:10px 0 10px 0;">
			<input type="text" name="memberPhone" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="ex)01012345678 (-)제외" maxlength="13" >
		</div>
		<div style="padding:10px 0 10px 0;">
			<input type="email" name="memberEmail" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="이메일 입력" maxlength="30">
		</div>
		
	</div>
	<div class="button" style="width:300px; margin:0; text-align:center;">
			<input type="button" name ="btn" value="찾기" onclick="check();" class="button"> 
	</div>
</div>

</form>
</body>
</html>













