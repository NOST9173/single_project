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
<%@ page import="domain.*" %>
<% MemberVo mv = (MemberVo)request.getAttribute("mv"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member Join</title>
<link type="text/css" rel="stylesheet" href="../css/default.css">
<script>
function check(){
//		alert("테스트");
		
		var fm = document.frm;
		
		if (fm.memberName.value == ""){
	  		alert("이름을 입력하세요");  		
	  		fm.memberName.focus();
	  		return;
	  	}
		/* else if(fm.year.value ==""){    //isNaN() 은 숫자인지 문자인지 검사하는 함수 
	  		alert("년도를 입력하세요");
	  		fm.year.focus();
	  		return;
	  	} */
		else if (fm.memberId.value ==""){
	  		alert("아이디를 입력하세요");
	  		fm.memberId.focus();
	  		return;
	  	}
	  	/* else if(fm.memberId.value == ""){
	  		alert("아이디를 입력하지 않았습니다.");
	  		return ;
	  	}else if((fm.memberId.value<"0" || fm.memberId.value>"9")&&(fm.memberId.value<"A"||fm.memberId.value>"Z")&&(fm.memberId.value<"a")&&(fm.memberName.value>"z")){
	  		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
			return ;
	  	} */
	  	else if (fm.idDuplication.value != "idCheck"){
	  		alert("아이디 중복체크를 해주세요.");
	  		
	  		return;
	  	}
	  	else if (fm.memberPwd.value ==""){
	  		alert("비밀번호를 입력하세요");
	  		fm.memberPwd.focus();
	  		return;
	  	}else if (fm.memberPwd2.value ==""){
	  		alert("비밀번호 확인을 입력하세요");
	  		fm.memberPwd2.focus();
	  		return;
	  	}else if (fm.memberPwd.value != fm.memberPwd2.value){
	  		alert("비밀번호가 일치하지 않습니다.");
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
		/* if (isNaN(fm.year.value)){
			alert("년도는 숫자만 입력가능합니다.");
			fm.year.focus();
			return false;
			
		}  */
		else {
			fm.idDuplication.value="idCheck";
			
		}
  	
  		// 가상경로를 사용해서 페이지 이동시킨다
  	//	fm.action = "./memberJoinOk.jsp";
  		fm.action = "<%=request.getContextPath()%>/member/memberJoinAction.do";
  		fm.method = "post";
  		fm.submit();
   return;
	
}

// 아이디 중복체크 화면 open
function openIdChk(){
	
	
	window.name = "parentForm";
	window.open("IdCheckForm.jsp","chkForm","width=500, height=300, resizable= no, scrollbars = no");
}

// 아이디 입력창에 값 입력시 hiddendp idUncheeck를 세팅한다.
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
// 다시 중복체크를 하도록 한다.

function inputIdChk(){
	document.frm.idDuplication.value = "idUncheck";
	
}
function mainHome(){
	location.href="<%=request.getContextPath()%>/pages/index.do";
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
	font-size: 13px;
	margin: 4px 4px;
	cursor: pointer;
	}
	
option {
	text-align:right;
}
.MenuVar { text-align:center;}
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
 <table border="1" style="text-align:left;width:500px;height:600px;border-collapse: collapse; margin-left: auto; margin-right: auto; margin-top:50px;">
	<tr>
		<td style="text-align:center;">
			<input type="text" name="memberName" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="이름을 입력" maxlength="15" style="text-align:center;">
		</td>
	</tr>
	<tr>
	<!-- 	<td style="text-align:center;">
			<input type="text" name="year" style="border:none;border-bottom:1px solid #CCC;" placeholder="년도" size="8" maxlength="4">
			 <select style="width:50px">
                    <option>01</option>
                    <option>02</option>
                    <option>03</option>
                    <option>04</option>
                    <option>05</option>
                    <option>06</option>
                    <option>07</option>
                    <option>08</option>
                    <option>09</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                </select>
                <span>월</span>
                 <select style="width:50px">
                    <option>01</option>
                    <option>02</option>
                    <option>03</option>
                    <option>04</option>
                    <option>05</option>
                    <option>06</option>
                    <option>07</option>
                    <option>08</option>
                    <option>09</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    <option>13</option>
                    <option>14</option>
                    <option>15</option>
                    <option>16</option>
                    <option>17</option>
                    <option>18</option>
                    <option>19</option>
                    <option>20</option>
                    <option>21</option>
                    <option>22</option>
                    <option>23</option>
                    <option>24</option>
                    <option>25</option>
                    <option>26</option>
                    <option>27</option>
                    <option>28</option>
                    <option>29</option>
                    <option>30</option>
                    <option>31</option>
                </select>
                 <span>일</span>
		</td>
	</tr> -->
	<tr>
		<td style="text-align:center;">
			<input type="text" name="memberId" size="30" onkeydown="inputIdChk()" style="border:none;border-bottom:1px solid #CCC;" placeholder="아이디 입력" maxlength="20" >
			<input type="button" value="중복확인" onclick="openIdChk()" class="button">
			<input type="hidden" name="idDuplication" value="idUncheck">
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
			<input type="password" name="memberPwd" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="비밀번호 입력" maxlength="20">
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
			<input type="password" name="memberPwd2" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="비밀번호 확인" maxlength="20">
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
			<input type="radio" name="memberNationality" value="내국인" checked>내국인 &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
			<input type="radio" name="memberNationality" value="외국인">외국인
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
			<input type="radio" name ="memberGender" value="M" checked>남자 &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
			<input type="radio" name ="memberGender" value="F">여자
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
			<input type="text" name="memberPhone" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="ex) 01012345678 (-)제외" maxlength="13" >
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
			<input type="email" name="memberEmail" size="30" style="border:none;border-bottom:1px solid #CCC;" placeholder="이메일 입력" maxlength="30">
		</td>
	</tr>
	<tr>
		<td style="text-align:center; width:50px;height:30px;">
			<input type="button" name ="btn" value="가입하기" onclick="check();" class="button"> 
			<input type="button" value="취소" onclick="mainHome();" class="button">
		</td>
	</tr>
</table>  
 </form>
</body>
</html>

















