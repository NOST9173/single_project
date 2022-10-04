<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "domain.BoardVo" %>

    <%
if(session.getAttribute("midx")== null){
	out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
}
%>

    
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
	padding:0 4% 0 4%;	
}

</style>
<script>
function check(){
	  //	alert("테스트");
	  	
	  	var fm = document.frm;
	  	
	  	if (fm.subject.value ==""){
	  		alert("제목을 입력하세요");
	  		fm.subject.focus();
	  		return;
	  	} else if (fm.content.value == ""){
	  		alert("내용을 입력하세요");  		
	  		fm.content.focus();
	  		return;
	  	}else if (fm.writer.value == ""){
	  		alert("작성자를 입력하세요");  		
	  		fm.writer.focus();
	  		return;
	  	} 	  	
	  		// 가상경로를 사용해서 페이지 이동시킨다
	  		fm.action = "<%=request.getContextPath()%>/a_board/boardModifyAction.do";
	
		fm.method = "post";
		fm.submit();
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
<input type="hidden" name="bidx"  value="<%=bv.getBidx() %>" >
		<div>
			<table style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto; width:620px;">
				<tr>
					<td style="text-align: center;"></td>
					<td >
						<input type="text" name="subject" size="103" maxlength="100" placeholder="" value="<%=bv.getSubject() %>" >
						
					</td>
				</tr>
				<tr>
					<td style="text-align: center;"></td>
					<td>
						<textarea cols="85" rows="40" name="content" placeholder=""><%=bv.getContent() %></textarea>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center;"></td>
					<td style="text-align: right;">
						<input type="text" name="writer" size="20" maxlength="50" placeholder="" style="text-align: right;" value="<%=bv.getWriter() %>">
												<!-- readonly="readonly" -->
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
						<input type="button" class="button" name="btn" value="작성" onclick="check();"> 
						<input type="reset" class="button" value="다시작성">
						<a href="<%=request.getContextPath() %>/pages/index.do"><input type="button" class="button" name="btn" value="메인"></a>  
						<input type="button" class="button" name="list" value="목록" onclick="location.href='<%=request.getContextPath()%>/a_board/boardList.do'">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"></td>
				</tr>
			</table>
		</div>
	</form>
	</td>
</tr>

</table>



</body>
</html>