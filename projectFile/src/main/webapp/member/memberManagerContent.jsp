<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "domain.*"%>    
<%
 	BoardVo bv =(BoardVo) request.getAttribute("bv");
 
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
<title></title>
<script>
function deletePost(){
	/* window.open("boardDelete.jsp","Delete","width=500, height=300, resizable= no, scrollbars = no") */
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		var form = document.frm; // 이름(name)이 "frm"인 폼 선택
		form.method = "post";			//전송방식
		form.action = "<%=request.getContextPath()%>/member/memberManagerDeleteAction.do";	 
		form.submit();	// 폼값 전송
		
	}
	
}
function check(){
  	//alert("테스트");
  	
  	var fm = document.frm;
  	if (confirm("삭제를 실행합니다. 삭제 하시겠습니까?")) {
  	    // 확인 버튼 클릭 시 동작
  		alert("삭제 되었습니다.");
  		fm.action = "<%=request.getContextPath()%>/member/memberManagerDeleteAction.do";
  		
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
function noticeList(){
	location.href="<%=request.getContextPath()%>/member/noticeList.do";
}
</script>
<style>
  .button {
	background-color: black;
	border: 1px solid black;
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

<div>
	<p style="text-align:center; color:#ff4e59;"><strong><span style="background-color:yellow; font-size:2em;">공지사항</span></strong></p>
</div>
<br>
<br>

<form name="frm">
		<div>
			<table border="1" style="border:1px solid #CCC;text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto; width:600px;">
				<tr>
					<td style="color:#ff4e59; "><strong><%=bv.getSubject() %></strong></td>
				</tr>
				<tr>
					<td style="vertical-align:top;" width="700px" height="600px"><%=bv.getContent() %></td>
				</tr>
				<tr>
					<td style="text-align: right; "><%=bv.getWriter() %></td>
					<!-- readonly="readonly" -->
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
					<% if(session.getAttribute("manager_id").equals("Y")){ %>
					<input type="button" class="button" name="managerpage" value="NoticeList" onclick="noticeList();">
					<input type="button" class="button" name="modify" value="수정" onclick="location.href='<%=request.getContextPath()%>/member/noticeModify.do?bidx=<%=bv.getBidx()%>'"> 
					<input type="button" class="button" name="delete" value="삭제" onclick="check()">
					<%} else { %><input type="hidden"><%} %>
					<input type="hidden" name="bidx" value="<%=bv.getBidx() %>"> 
					<input type="button" class="button" name="list" value="사용팁글 목록" onclick="location.href='<%=request.getContextPath()%>/a_board/boardList.do'"> 
					<input type="button" class="button" name="list" value="구매팁글 목록" onclick="location.href='<%=request.getContextPath()%>/b_board/boardList.do'"> 
					<input type="button" class="button" name="list" value="질문글 목록" onclick="location.href='<%=request.getContextPath()%>/c_board/boardList.do'"> 
					</td>
				</tr>
			</table>
		</div>
	</form>
	

</body>
</html>




















