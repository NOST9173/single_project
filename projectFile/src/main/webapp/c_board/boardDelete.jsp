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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function check(){
	  	//alert("테스트");
	  	
	  	var fm = document.frm;
	  	if (confirm("삭제를 실행합니다. 삭제 하시겠습니까?")) {
	  	    // 확인 버튼 클릭 시 동작
	  		alert("삭제 되었습니다.");
	  		fm.action = "<%=request.getContextPath()%>/c_board/boardDeleteAction.do";
	  		
			fm.method = "post";
			fm.submit();
	  	    
	  	}else{
	  	    // 취소 버튼 클릭 시 동작
	  	    alert("취소 되었습니다.");
	  	   
	  	}
	  	  	
	  		// 가상경로를 사용해서 페이지 이동시킨다
	  		
		return;
	}
</script>

<script>

	function deletePost(){
		var confirmed = confirm("정말로 삭제하겠습니까?");
		if(confirmed){
			var form = document.frm; // 이름(name)이 "writeFrm"인 폼 선택
			form.method = "post";			//전송방식
			form.action = "<%=request.getContextPath()%>/c_board/boardDeleteAction.do";	 
			form.submit();	// 폼값 전송
			
		}
		
	}
</script>
<title></title>
</head>
<body>
<form name="frm">
<input type="hidden" name="bidx" value="<%=bv.getBidx() %>" >
<button type="button" onclick="check()">삭제하기</button>

</form>

</body>
</html>