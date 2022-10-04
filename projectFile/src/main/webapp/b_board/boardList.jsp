<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="domain.*" %>
     <%
    ArrayList<BoardVo> alist =(ArrayList<BoardVo>) request.getAttribute("alist");
    ArrayList<BoardVo> mlist =(ArrayList<BoardVo>) request.getAttribute("mlist");
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="../css/default.css">
<title>사용 팁 page</title>

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
 }
 th{
 	border-right:0; border-left:0;
 	background:#f9f9f8;
 	color:#333;
 	
 }
 a {
	text-decoration-line: none;
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

.MenuVar {text-align:center;}
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
			<%if (midx == 0) {%><a href="<%=request.getContextPath() %>/member/memberLogin.do" class="a_padding">로그인</a>
			<!--로그인 후 화면  --><%} else if (midx > 0) {%>
								<a href="<%=request.getContextPath() %>/member/memberMyPage.do" class="a_padding">MyPage</a>
								<a href="<%=request.getContextPath() %>/member/memberLogout.do" class="a_padding">로그아웃</a>
								<%};%>
	</div>
</div>
<hr>



<div class="nav" style="border-bottom:1px solid #CCC; border-top:1px solid #CCC;">
	<div class="nav-button" style="text-align:center; padding:15px">
		<a href="<%=request.getContextPath() %>/a_board/boardList.do" style="padding:0px 10% 0px 10%">사용 팁</a>
		<a href="<%=request.getContextPath() %>/b_board/boardList.do" style="padding:0px 10% 0px 10%"><strong>구매 팁</strong></a>
		<a href="<%=request.getContextPath() %>/c_board/boardList.do" style="padding:0px 10% 0px 10%">질문</a>
	</div>
</div>
<br>
<br>

<form name="frm" action="<%=request.getContextPath() %>/b_board/boardList.do" method="post">
<table border="1" style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto; width:900px; border:none; border-bottom:1px solid #CCC; border-right:0; border-left:0; ">
	<tr>
		<td style="color:skyblue;">
		<strong><span>구매 팁</span></strong>
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
</from>
	<tr style="color:white; background-color:skyblue; border-right:0; border-left:0; ">
		<th style="width:10%; border-right:0; border-left:0; background-color:white;"> </th>
		<th style="width:60%; border-right:0; border-left:0; background-color:white;">제목</th>
		<th style="width:10%; border-right:0; border-left:0; background-color:white;">작성자</th>
		<th style="width:15%; border-right:0; border-left:0; background-color:white;">작성일</th>
		<th style="width:5%; border-right:0; border-left:0; background-color:white;">조회</th>
	</tr>
	
	<form>
	<%for(BoardVo bv : mlist){ %>
		<tr>
			<th><strong style="border:1px solid #ffc6c9;background-color:#ffe3e4;display:block;text-align:center;border-radius:6px;"><span style="color:#ff4e59; text-align:center;">공지</span></strong></th>
			<th>
				<a href="<%=request.getContextPath()%>/member/memberManagerContent.do?bidx=<%=bv.getBidx()%>" style="color:#ff4e59;"><%=bv.getSubject() %></a>
			</th>
			<th><%=bv.getWriter()%></th>
			<th><%=bv.getWriteday().substring(0,10) %></th>
			<th></th>
		</tr>
		<%} %> 
	</form>
		
		
	<%for(BoardVo bv : alist){ %>
	<tr style="height:30px; ">
		<td><%=bv.getBidx() %></td>
		<td><%
			for (int i =1;i<=bv.getLevel_();i++){
				out.print("&nbsp;&nbsp;");   // &nbsp -> 공백, 스페이스바, 한칸
				if(i==bv.getLevel_()){
					out.print(" ㄴ");
				}
			}
			%>
			<a href="<%=request.getContextPath()%>/b_board/boardContent.do?bidx=<%=bv.getBidx() %>"><%=bv.getSubject() %></a></td>
		<td><%=bv.getWriter() %></td>
		<td><%=bv.getWriteday() %></td>
		<td></td>
	</tr>
	<%} %>
	<tr >
		<td colspan="5" style="text-align: right; border-bottom:0;">
			<a href="<%=request.getContextPath() %>/b_board/boardWrite.do"><input type="button" class="button" name="btn" value="글쓰기"></a>  
		</td>
	</tr>
	</table>
<table style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto;  width:800px;">
	<tr>
		<td style="text-align:center;">
		<% if (pm.isPrev()==true) {
			out.println("<a href='"+request.getContextPath()+"/b_board/boardList.do?page="+(pm.getStartPage()-1)+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>◀</a>");
		}
			%>
		</td>
		<td style="text-align:center;">
	
		<% 
			for(int i =pm.getStartPage();i<=pm.getEndPage();i++){
				out.println("<a href='"+request.getContextPath()+"/b_board/boardList.do?page="+i+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>"+i+"</a>");
				
			}
		%>
	
		</td>
		<td style="text-align:center;">
		<% if (pm.isNext() && pm.getEndPage() > 0){
			out.println("<a href='"+request.getContextPath()+"/b_board/boardList.do?page="+(pm.getEndPage()+1)+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>▶</a>");
		} %>
		</td>
	</tr>
</table>


</body>
</html>















