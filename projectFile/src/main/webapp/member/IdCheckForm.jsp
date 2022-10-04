<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인 </title>
<script>
function pValue(){
	document.getElementById("memberId").value = opener.document.frm.memberId.value;
	// 부모창에서 입력값을 현재의 창에 대입하는 함수 
}

 function idCheck() {
	var id = document.getElementById("memberId").value = opener.document.frm.memberId.value;
	if(!id){
		alert("아이디를 입력하지 않았습니다.");
		return false;
	}
	else if((id<"0" || id>"9")&&(id<"A"||id>"Z")&&(id<"a" || id>"z")){
		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
		return false;
	}
	
	
	checkForm.action = "<%=request.getContextPath()%>/member/IdCheckFormAction.do ";
	checkForm.method = "post";
	checkForm.submit();
	

return;
	 
 }
 
 /* function callback(){
		if(httpRequest.readyState == 4){
			// 결과값을 가져온다.
			var resultText = httpRequest.responseText;
			if(resultText == 0 ){
				alert("사용할 수 없는 아이디입니다.");
				document.getElementById("cancelBtn").style.visibility="hidden";
				document.getElementById("useBtn").style.visivility="hidden";
				document.getElementById("msg").innerHTML = "";
		}
		else if (resultText == 1){
			document.getElementById("cancelBtn").style.visibility="hidden";
			document.getElementById("useBtn").style.visibility="hidden";
			document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
			}
		}
	} */
	
	
		//사용하기 클릭 시 부모창으로 값 전달
	function sendCheckValue(){
		//중복체크 결과인 idCheck 값을 전달한다.
		opener.document.frm.idDuplication.value = "idCheck";
		//회원가입 화면의 ID입력란에 값을 전달
		opener.document.frm.memberId.value=document.getElementById("memberId").value;
		
		if (opener != null){
			opener.chkForm = null;
			self.close();
		}
		
	}


	<%-- function idCheck(){
		var id = document.getElementById("userId").value = opener.document.checkForm.memberId.value;
		
		if(!id){
			alert("아이디를 입력하지 않았습니다.");
			return false;
		}
		else if((id<"0" || id>"9")&&(id<"A"||id>"Z")&&(id<"a" || id>"z")){
			alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
			return false;
		}
		/* else {
			var param="memberId"+id
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = callback;
			httpRequest.open("POST", "memberIdCheckAction.do", true);
			httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			httpRequset.send(param);
		} */
		checkForm.action = "<%=request.getContextPath()%>/member/IdCheckFormAction.do ";
		checkForm.method = "post";
		checkForm.submit();
		
				
	}
	
	function callback(){
		if(httpRequest.readyState == 4){
			// 결과값을 가져온다.
			var resultText = httpRequest.responseText;
			if(resultText == 0 ){
				alert("사용할 수 없는 아이디입니다.");
				document.getElementById("cancelBtn").style.visibility="hidden";
				document.getElementById("useBtn").style.visivility="hidden";
				document.getElementById("msg").innerHTML = "";
		}
		else if (resultText == 1){
			document.getElementById("cancelBtn").style.visibility="hidden";
			document.getElementById("useBtn").style.visibility="hidden";
			document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
			}
		}
	}
		//사용하기 클릭 시 부모창으로 값 전달
	function sendCheckValue(){
		//중복체크 결과인 idCheck 값을 전달한다.
		opener.document.checkForm.idDuplication.value = "idCheck";
		//회원가입 화면의 ID입력란에 값을 전달
		opener.document.checkForm.memberId.value=document.getElementById("userId").value;
		
		if (opener != null){
			opener.chkForm = null;
			self.close();
		}
		
	}
		
 --%>
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
</style>	

</head>
<body onload="pValue()">

<div id = "wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="memberId" id="memberId" value="">
			<input type="button" value="중복확인" onclick="idCheck()"  class="button">
		</form>
		<div id="msg"></div>
		<br>
		<input id ="cancelBtn" type="button" value="취소" onclick="window.close()" class="button"><br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()" class="button">
	
	</div>

</div>

</body>
</html>

















