<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="domain.*" %>   
<%@ page import = "java.util.*" %> 
<%
	//select 쿼리를 사용하기 위해서 function에서 메소드를 만든다
	//memberSelectAll 메소드 호출한다
	//MemberDao md = new MemberDao();
//	ArrayList<MemberVo> alist = md.memberSelectAll() ;
//	out.println(alist.get(0).getMembername()+"<br>");

    ArrayList<MemberVo> alist=(ArrayList<MemberVo>)request.getAttribute("alist");
	
%> 
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
<title>memberList</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<style>
 table {
	 border:none;
	 border-bottom:1px solid #CCC;
 }
 td {
	border-right:0; border-left:0;
	
 }
  th{
 	border-right:0; border-left:0;
 	background:#f9f9f8;
 	color:#333;
 	
 }
  .button {
	background-color: powderblue;
	border: 1px solid powderblue;
	border-radius:6px;
	color: white;
	font-size: 1em;
	margin: 4px 4px;
	cursor: pointer;
	
	}
a {
	text-decoration-line: none;
}
.MenuVar {text-align:center;}
a {
	dispaly:inline-block;
	padding:0 50px 0 50px;
}

</style>

</head>
<body>

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

<h2 style="text-align:center;padding:50px 0 50px 0; color:#ff4e59;"><strong><span style="background-color:yellow;">memberList</span></strong></h2>

<table border="1" style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto; width:500px; border:none; border-bottom:1px solid #CCC; border-right:0; border-left:0; ">
	<tr  style="color:white; background-color:skyblue; border-right:0; border-left:0; ">
		<th style="width:10%; border-right:0; border-left:0;">번호</th>
		<th style="width:15%; border-right:0; border-left:0;">회원 이름</th>
		<th style="width:30%; border-right:0; border-left:0;">회원 연락처</th>
		<th style="width:35%; border-right:0; border-left:0;">가입일</th>
	</tr>
	<% for (MemberVo mv : alist) {%>
	<tr >
		<td><%=mv.getMidx() %></td>
		<td><%=mv.getMembername() %></td>
		<td><%=mv.getMemberphone() %></td>
		<td><%=mv.getWriteday() %></td>
	</tr>
<% } %>

	<tr >
		<td colspan="4" style="text-align: right; border-bottom:0;">
			<a href="<%=request.getContextPath() %>/pages/index.do" style="padding:4px;"><input type="button" class="button" name="btn" value="MAIN"></a>
			<a href="<%=request.getContextPath() %>/member/memberMyPage.do" style="padding:4px;"><input type="button" class="button" name="MyPage" value="MyPage"></a>
			<a href="<%=request.getContextPath() %>/member/memberManager.do" style="padding:4px;"><input type="button" class="button" name="ManagerPage" value="ManagerPage"></a>
			  
			  
		</td>
	</tr>
</table>

</body>
</html>


















