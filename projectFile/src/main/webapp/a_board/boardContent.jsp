<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "domain.BoardVo"%> 
 <%@ page import = "domain.*" %>   
<%
 	BoardVo bv =(BoardVo) request.getAttribute("bv");
 	
%>
<%
MemberVo mv = (MemberVo) request.getAttribute("mv");
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
<link type="text/css" rel="stylesheet" href="../css/default.css">
<title></title>
<style>

  .button {
	background-color: powderblue;
	border: none;
	color: white;
	font-size: 13px;
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

<script>
<%-- function deletePost(){
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		var form = document.frm; // 이름(name)이 "frm"인 폼 선택
		form.method = "post";			//전송방식
		form.action = "<%=request.getContextPath()%>/a_board/boardDeleteAction.do";	 
		form.submit();	// 폼값 전송
		
	}
	
} --%>


function check(){
  	//alert("테스트");
  	
  	var fm = document.frm;
  	if (confirm("삭제를 실행합니다. 삭제 하시겠습니까?")) {
  	    // 확인 버튼 클릭 시 동작
  		alert("삭제 되었습니다.");
  		fm.action = "<%=request.getContextPath()%>/a_board/boardDeleteAction.do";
  		
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
</script>

</head>
<body>
<div id="header">
	<div class="MenuVar">
			<a href="<%=request.getContextPath() %>/pages/index.do"  style="color:skyblue;">MAIN</a>
			<a href="<%=request.getContextPath() %>/pages/applePage.do">애플</a>
			<a href="<%=request.getContextPath() %>/pages/samsungPage.do" >삼성</a>
			<a href="<%=request.getContextPath() %>/pages/LGPage.do" >LG</a>
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" ><strong>게시판</strong></a>
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

<div class="nav" style="border-bottom:1px solid #CCC; border-top:1px solid #CCC;">
	<div class="nav-button" style="text-align:center; padding:15px">
		<a href="<%=request.getContextPath() %>/a_board/boardList.do" style="padding:0px 10% 0px 10%"><strong>사용 팁</strong></a>
		<a href="<%=request.getContextPath() %>/b_board/boardList.do" style="padding:0px 10% 0px 10%">구매 팁</a>
		<a href="<%=request.getContextPath() %>/c_board/boardList.do" style="padding:0px 10% 0px 10%">질문</a>
	</div>
</div>
<br>
<br>

<form name="frm">
		<div>
			<table border="1" style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto; width:820px;">
				<tr>
					<td style="text-align: center;" >제목</td>
					<td><%=bv.getSubject() %></td>
				</tr>
				<tr>
					<td style="text-align: center;">내용</td>
					<td style="vertical-align: top;  text-align: left;" width="700px" height="600px"><%=bv.getContent() %></td>
				</tr>
				<%-- <tr>
					<td >
					<%if (bv.getFilename() != null){ %><img alt="" src="<%=request.getContextPath() %>/images/<%=bv.getFilename() %>"><%} else{%>없음<%} %>
					파일 이름 가져오기  <%= bv.getFilename()%>
					</td>
				</tr> --%>
				<tr>
					<td style="text-align: center;">작성자</td>
					<td style="text-align: right; "><%=bv.getWriter() %></td>
					<!-- readonly="readonly" -->
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
							<% if((int)session.getAttribute("midx")==bv.getMidx()){ %>
					<input type="button" class="button" name="modify" value="수정" onclick="location.href='<%=request.getContextPath()%>/a_board/boardModify.do?bidx=<%=bv.getBidx()%>'"> 
				
			<!--	System.out.println("session"+session.getAttribute("midx"));
					System.out.println("bv"+bv.getMidx());  -->
					
				
					<input type="button" class="button" name="delete" value="삭제" onclick="check();">
					<% } else { %>
					<input type="hidden"><% }%>
					
			<!-- 		<input type="button" class="button" name="delete" value="삭제" onclick="check()"> -->
					<input type="hidden" name="bidx" value="<%=bv.getBidx() %>" >
					<%-- <input type="button" class="button" name="delete" value="삭제" onclick="location.href='<%=request.getContextPath()%>/a_board/boardDelete.do?bidx=<%=bv.getBidx()%>'"> --%> 
					<input type="button" class="button" name="reply" value="답변" onclick="location.href='<%=request.getContextPath()%>/a_board/boardReply.do?bidx=<%=bv.getBidx()%>&originbidx=<%=bv.getOriginbidx()%>&depth=<%=bv.getDepth()%>&level_=<%=bv.getLevel_()%>'"> 
					<input type="button" class="button" name="list" value="목록" onclick="location.href='<%=request.getContextPath()%>/a_board/boardList.do'"> 
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"></td>
				</tr>
			</table>
		</div>
	</form>
	

</body>
</html>


















