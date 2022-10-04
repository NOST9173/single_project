<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.*" %>
 <%
ArrayList<BoardVo> mlist =(ArrayList<BoardVo>) request.getAttribute("mlist");
 
 
 PageMaker pm =(PageMaker)request.getAttribute("pm");
 /* BoardVo bv = (BoardVo) request.getAttribute("bv"); */

 System.out.println(session.getAttribute("manager_id")); 
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
 
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="../css/default.css">
<title>NoticeList</title>

<style>
 table {
	 border:none;
	 border-bottom:0px solid #CCC;
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
	font-size: 13px;
	margin: 4px 4px;
	cursor: pointer;
	
	}
a {
	text-decoration-line: none;
}
.MenuVar {text-align:center; }
.a_padding {
	dispaly:inline-block;
	padding:0 50px 0 50px;
	
}

</style>

</head>
<body>
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;" class="a_padding">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do" class="a_padding">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" class="a_padding">삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" class="a_padding">LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" class="a_padding"><strong>게시판</strong></a>
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do" class="a_padding">고객지원</a>
			<a href="<%=request.getContextPath() %>/pages/search.do" class="a_padding">Google 검색</a>
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
<br>

<form name="frm" >
	<table border="1" style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto; width:900px; border:none; border-bottom:1px solid #CCC; border-right:0; border-left:0; ">
		<tr>
			<td style="color:skyblue;">
			<strong><span style="background-color:yellow;text-align:center;padding: 0; color:#ff4e59;">공지사항 목록</span></strong>
			</td>
			<td></td>
			<td >
				<select name="searchType">
				<option value="subject">제목</option>
				<option value="wirter">작성자</option>
				</select>
			</td>
			<td>
				<input type="text" name="keyword" size="15">
			</td>
			<td>
				<input type="submit" name="submit" value="검색" class="button">
			</td>
		</tr>
	
	
		<tr style="color:white; background-color:skyblue; border-right:0; border-left:0; ">
			<th style="width:10%; border-right:0; border-left:0; background-color:white;"> </th>
			<th style="width:60%; border-right:0; border-left:0; background-color:white;">제목</th>
			<th style="width:10%; border-right:0; border-left:0; background-color:white;">작성자</th>
			<th style="width:15%; border-right:0; border-left:0; background-color:white;">작성일</th>
			<th style="width:5%; border-right:0; border-left:0; background-color:white;">조회</th>
		</tr>
		<%for(BoardVo bv : mlist){ %>
		<tr>
			<th ><strong style="border:1px solid #ffc6c9;background-color:#ffe3e4;display:block;text-align:center;border-radius:6px;"><span style="color:#ff4e59; text-align:center;">공지</span></strong></th>
			<th >
				<a href="<%=request.getContextPath()%>/member/memberManagerContent.do?bidx=<%=bv.getBidx()%>"  style="color:#ff4e59;"><%=bv.getSubject() %></a>
			</th>
			<th><%=bv.getWriter()%></th>
			<th><%=bv.getWriteday().substring(0,10) %></th>
			<th></th>
		</tr>
		<%} %> 
		
		<tr>
		
			<td colspan="5" style="text-align: right; border-bottom:0;">
				<a href="<%=request.getContextPath() %>/member/memberManagerWrite.do" style="padding:0;"><input type="button" class="button" name="btn" value="공지사항 등록"></a>  
				<input type="button" class="button" name="list" value="사용팁글 목록" onclick="location.href='<%=request.getContextPath()%>/a_board/boardList.do'"> 
				<input type="button" class="button" name="list" value="구매팁글 목록" onclick="location.href='<%=request.getContextPath()%>/b_board/boardList.do'"> 
				<input type="button" class="button" name="list" value="질문글 목록" onclick="location.href='<%=request.getContextPath()%>/c_board/boardList.do'"> 
				<input type="button" class="button" name="list" value="ManagerPage" onclick="location.href='<%=request.getContextPath()%>/member/memberManager.do'"> 
			</td>
		</tr>
	</table>
	
</form>

</body>
</html>





















