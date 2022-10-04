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
<meta charset="UTF-8">
<title>E-mail</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<style>

 .button {
	
	background-color: powderblue;
	border: none;
	color: white;
	padding: 5px 15px;
	text-align: right;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
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
function onclick(){
		
		
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
			<a href="<%=request.getContextPath() %>/pages/boardPages.do" >게시판</a>
			<a href="<%=request.getContextPath() %>/pages/customerSupport.do"><strong>고객지원</strong></a>
			<a href="<%=request.getContextPath() %>/pages/search.do">Google 검색</a>
			<%if (midx == 0) {%><a href="<%=request.getContextPath() %>/member/memberLogin.do" >로그인</a>
			<!--로그인 후 화면  --><%} else if (midx > 0) {%><a href="<%=request.getContextPath() %>/member/memberLogout.do">로그아웃</a><%};%>

	</div>
</div>
<hr>

<form name="frm">
		<div>
			<table style="text-align:center; border-collapse: collapse; margin-left: auto; margin-right: auto; width:620px;">
				<tr>
					<td style="text-align: left;"></td>
					<td style="text-align: left;">담당자에게</td>
				</tr>
				<tr>
					<td style="text-align: center;"></td>
					<td >
						<input type="text" name="subject" size="98" maxlength="100" placeholder="문의 제목" >
					</td>
				</tr>
				<tr>
					<td style="text-align: center;"></td>
					<td>
						<textarea cols="85" rows="40" name="content" placeholder="문의 내용"></textarea>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center;"></td>
					<td style="text-align: right;">
						<input type="text" name="writer" size="20" maxlength="50" placeholder="작성자" readonly="readonly" style="text-align: right;" value="<%=session.getAttribute("memberName")%>">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
						<input type="button" class="button" name="btn" value="작성" onclick="onclick();"> 
						<input type="reset" class="button" value="다시작성">
						<a href="<%=request.getContextPath() %>/pages/index.do" style="padding: 0px;"><input type="button" class="button" name="btn" value="메인"></a>  
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













