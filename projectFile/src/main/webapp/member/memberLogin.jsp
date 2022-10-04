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
<title>Login</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
  <script>
  function check(){
  	//alert("테스트");
  	
  	var fm = document.frm;
  	
  	if (fm.memberId.value ==""){
  		alert("아이디를 입력하세요");
  		fm.memberId.focus();
  		return;
  	}else if (fm.memberPwd.value ==""){
  		alert("비밀번호를 입력하세요");
  		fm.memberPwd.focus();
  		return;
  	}
  	
  		// 가상경로를 사용해서 페이지 이동시킨다
  	//	fm.action = "./memberJoinOk.jsp";
  		fm.action = "<%=request.getContextPath()%>/member/memberLoginAction.do ";
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
	font-size: 10px;
	margin: 4px 4px;
	cursor: pointer;
	}
	
.MenuVar { text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
}
li{
	display:inline;
}
body{

	background-image:url('../image/apple2022wwdc.png');
	background-repeat: no-repeat;
	background-position: center center;
	background-size : cover;
	background-color: black;
	
}
</style>

</head>

<body >
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" >삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" >LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" >게시판</a>
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do">고객지원</a>
			<a href="<%=request.getContextPath() %>/pages/search.do">Google 검색</a>
			<%if (midx == 0) {%><a href="<%=request.getContextPath() %>/member/memberLogin.do" ><strong style="color: white;">로그인</strong></a>
			<!--로그인 후 화면  --><%} else if (midx > 0) {%>
								<a href="<%=request.getContextPath() %>/member/memberMyPage.do">MyPage</a>
								<a href="<%=request.getContextPath() %>/member/memberLogout.do">로그아웃</a>
								<%};%>
	</div>
</div>
<hr>
<form name="frm"> 
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div style="margin-top:100px; margin-bottom:100px;">
	<div style="text-align:center;width:300px;height:200px;border-collapse: collapse; margin-left: auto; margin-right: auto; padding:20px 28px; margin-top:100px;">
		<div>
			<div style="border-radius:12px; box-shadow:none; display:table; width:100%;padding:14px 17px 12px; box-sizing:border-box; position:relative;height:100%;border:0px solid #CCC;">
				<input  type="text" name="memberId" style="border-radius:6px 6px 0 0; box-shadow:none; display:table; width:100%;padding:14px 17px 12px; box-sizing:border-box; position:relative;height:100%;border:0px solid #CCC;" placeholder="ID" maxlength="40">
			</div>
			<br>
			<div style="border-radius:12px; box-shadow:none; display:table; width:100%;padding:14px 17px 12px; box-sizing:border-box; position:relative;height:100%;border:0px solid #CCC;">
				<input  type="password" name="memberPwd" style="border-radius:6px 6px 0 0; box-shadow:none; display:table; width:100%;padding:14px 17px 12px; box-sizing:border-box; position:relative;height:100%;border:1px solid #CCC;" placeholder="PWD " maxlength="16">
			</div>
		</div>
		<br>
		<div style="margin:0; display:block; text-align:center; width:100%; padding:13px 0 13px; border-radius:6px;border:solid 1px #rgba; background-color: skyblue;">
			<input type="button" name ="btn" value="로그인" onclick="check();" class="button" style="font-size:20px; background-color:skyblue;">
		</div>
	</div>
	<div style="display:block; box-sizing:border-box; width:460px; margin: 0 auto;">
		<ul style="width:100%; list-style:none; text-align:center; padding:0;">
			<li><a href="memberIdSearch.jsp" style=" font-size:14px; line-height:17px; text-decoration:none; padding:30px;">아이디 찾기</a></li>
			<li><a href="memberPwdSearch.jsp" style=" font-size:14px; line-height:17px; text-decoration:none; padding:30px;" >비밀번호 찾기</a> </li> 
			<li><a href="memberJoin.jsp" style=" font-size:14px; line-height:17px; text-decoration:none; padding:30px;">회원가입</a></li>  
		</ul>
	</div>	
</div>	

 </form>


</body>
</html>















