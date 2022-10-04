package controller;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import domain.BoardVo;
import domain.MemberVo;
import service.BoardDao;
import service.MemberDao;


@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String uri = request.getRequestURI(); 
		String pj= request.getContextPath();
		String command= uri.substring(pj.length()); 
		System.out.println("command:"+command); 
		
		
		// 회원 가입 액션 부분
		//
		//
		//
		//
		if(command.equals("/member/memberJoinAction.do")) {
			
			//input 객체의 이름을 담은 파라미터를 호출하면 그 객체의 값을 리턴 
			
			String memberId = request.getParameter("memberId");
			String memberPwd = request.getParameter("memberPwd");
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String memberGender = request.getParameter("memberGender");
			String memberPhone = request.getParameter("memberPhone");
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			
			MemberDao md = new MemberDao();
			int value = md.insertMember(memberId,memberPwd,memberName,memberEmail,memberGender,memberPhone,ip);
			 
			if (value==1){
				out.println("<script>alert('회원가입 성공 ');location.href='../pages/index.do'</script>");	
				response.sendRedirect(request.getContextPath()+"/pages/index.do");
				
			}else{
				out.println("<script>alert('회원가입 실패 ');location.href='member/memberJoin.do'</script>");
				out.flush();
				//response.sendRedirect(request.getContextPath()+"/member/memberJoin.do");
				
				//out.println("<script>alert('회원가입 실패 ');location.href='./memberjoin.jsp'</script>");
			}
			//  
			//  
			// 회원 가입페이지 들어가는 부분 
			//
			//
			//
			//
		}else if (command.equals("/member/memberJoin.do")) {
			//회원가입 페이지로 들어오면 처리를 함 
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberJoin.jsp");
			rd.forward(request, response);	
			
		}
		//	회원리스트페이지 들어가는 부분 
		//
		//
		//
		else if (command.equals("/member/memberList.do")) {
			
			MemberDao md = new MemberDao();
			ArrayList<MemberVo> alist = md.memberSelectAll();
			
			request.setAttribute("alist", alist);			
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberList.jsp");
			rd.forward(request, response);	
			
		}
		// 로그인 페이지 들어가는 부분 
		//
		//
		//
		//
		else if (command.equals("/member/memberLogin.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberLogin.jsp");
			rd.forward(request, response);	
		}
		// 로그인 페이지 액션 부분 
		//
		//
		//
		//
		else if (command.equals("/member/memberLoginAction.do")) {
			//1. 넘어온 값을 받는다. 
			String memberId = request.getParameter("memberId");
			String memberPwd = request.getParameter("memberPwd");
			
			//2. 처리 -> 메소드를 만들어야 한다. 
			MemberDao md = new MemberDao();
			MemberVo mv = md.memberLogin(memberId, memberPwd);
			
			
			
			HttpSession session = request.getSession();
			
			
			//3.이동 
			if(mv != null) {
				session.setAttribute("midx", mv.getMidx());
				session.setAttribute("memberId", mv.getMemberid());
				session.setAttribute("memberName", mv.getMembername());
				session.setAttribute("memberPhone", mv.getMemberphone());
				session.setAttribute("memberEmail", mv.getMemberemail());
				session.setAttribute("memberGender", mv.getMembergender());
				session.setAttribute("manager_id", mv.getManager_id());
//				System.out.println(mv.getManager_id());
				
				
				
				if(session.getAttribute("saveUrl") != null) {
					response.sendRedirect((String)session.getAttribute("saveUrl"));
					
					
				}else {
					out.println("<script>alert('환영합니다^^');location.href='../pages/index.jsp'</script>");
					out.flush();
					
					//response.sendRedirect(request.getContextPath()+"/pages/index.do");
					
				}
				
			}else {
				out.println("<script>alert('로그인 실패');location.href='memberLogin.do'</script>");
				out.flush();
				//response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");
				
			}
			
		}
		// 로그아웃 부분 
		//
		//
		//
		//
		//
		else if (command.equals("/member/memberLogout.do")) {
			System.out.println("로그아웃");
			
			// session 변수 지정 
			//
			//
			
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect(request.getContextPath()+"/pages/index.do");
			
		}
		// my page 부분 
		//
		//
		//
		//
		else if (command.equals("/member/memberMyPage.do")) {
			System.out.println("회원 마이페이지 들어옴");
			//회원가입 페이지로 들어오면 처리를 함 
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberMyPage.jsp");
			rd.forward(request, response);	
			
		}
		// 아이디 찾기 페이지 부분 
		//
		//
		//
		//
		//
		else if (command.equals("/member/memberIdSearch.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberIdSearch.jsp");
			
			rd.forward(request, response);	
			
		}
		// 아이디찾기 액션 부분 
		//
		//
		//
		//
		//
		else if(command.equals("/member/memberIdSearchAction.do")) {
			// 1. 넘어온 값을 받고 
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String memberPhone = request.getParameter("memberPhone");
			
			// 2. 처리 한다 -> 메소드에 넣는다 
			MemberDao md = new MemberDao();
			MemberVo mv=md.memberIdSearch(memberName, memberEmail, memberPhone);
			
			// 3. 이동 한다.
			
			if(mv != null) {System.out.println("확인 ");
				request.setAttribute("mv", mv);
				RequestDispatcher rd = request.getRequestDispatcher("/member/memberId.do");
				rd.forward(request, response);

			}else {System.out.println("불가 ");
				out.println("<script>alert('정보가 틀립니다.');location.href='memberIdSearch.do'</script>");
//				response.sendRedirect(request.getContextPath()+"/member/memberIdSearch.do");
				
			}
		}
		// 아이디 찾았을 때 들어가는 페이지 
		//
		//
		//
		//
		//
		else if (command.equals("/member/memberId.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberId.jsp");
			
			rd.forward(request, response);	
			
		}
		// 비밀번호 찾기 페이지 부분 
		//
		//
		//
		//
		//
		else if (command.equals("/member/memberPwdSearch.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberPwdSearch.jsp");
			
			rd.forward(request, response);	
			
		}
		// 비밀번호 찾았을 때 페이지 
		//
		//
		//
		//
		//
		else if (command.equals("/member/memberPwd.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberPwd.jsp");
			
			rd.forward(request, response);	
			
		}
		// 비밀번호 찾기 액션 부분 
		//
		//
		//
		//
		//
		else if(command.equals("/member/memberPwdSearchAction.do")) {
			System.out.println("비밀번호찾기 실행 ");
			// 1. 넘어온 값을 받고 
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String memberEmail = request.getParameter("memberEmail");
			String memberPhone = request.getParameter("memberPhone");
			
			
			// 2. 처리 한다 -> 메소드에 넣는다 
			MemberDao md = new MemberDao();
			MemberVo mv=md.memberPwdSearch(memberId,memberName, memberEmail, memberPhone);
		
			
			// 3. 이동 한다.
			
			if(mv != null) {
				request.setAttribute("mv", mv);
				RequestDispatcher rd = request.getRequestDispatcher("/member/memberPwd.do");
				rd.forward(request, response);
			
			}else {
				out.println("<script>alert('정보가 틀립니다.');location.href='memberPwdSearch.do'</script>");
				out.flush();
//				response.sendRedirect(request.getContextPath()+"/member/memberIdSearch.do");
				
			}
		}
		//
		//
		//
		//
		//
		//
		// 아이디 중복 체크 부분 
		//
		//
		//
		//
		//
		else if(command.equals("/member/IdCheckForm.do")) {
			System.out.println("아이디 중복체크 페이지 들어옴 ");
				RequestDispatcher rd = request.getRequestDispatcher("/member/IdCheckForm.jsp");
				rd.forward(request, response);
			
				
	}
		else if (command.equals("/member/IdCheckFormAction.do")) {
			System.out.println("아이디중복체크 실행");
			String memberId = request.getParameter("memberId");
			
			MemberDao md = new MemberDao();
			MemberVo mv = md.IdCheckForm(memberId);
			System.out.println();
		
			if(mv !=null) { System.out.println("사용중이지 ");
				request.setAttribute("mv", mv);
				out.println("<script>alert('사용중인 아이디입니다.'); self.close();</script>");
															//history.back(); <-- 이전 페이지로 넘어가는 
				
			}else {System.out.println("사용가능하쥐 ");
				out.println("<script>alert('사용 가능한 아이디 입니다.'); history.back();</script>");
				
				
			}
		}
		//
		//
		//
		//
		//
		//
		// 회원 탈퇴 부분 
		//
		//
		//
		//
		//
		//
		
		else if(command.equals("/member/memberMyPage.do")) {
			System.out.println("회원 마이페이지 들어가기 ");
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberMyPage.jsp");
			rd.forward(request, response);
		
			
}
		else if (command.equals("/member/memberDeleteAction.do")) {
		
		System.out.println("회원 탈퇴 됨");
		
		// session 변수 지정 
		//
		HttpSession session = request.getSession();
		session.invalidate();
		
		String midx = request.getParameter("midx");
		System.out.println("midx"+midx);
		
		int midx_ = Integer.parseInt(midx);				
		MemberDao md = new MemberDao();
		int value = md.deleteMember(midx_);
	
		if (value == 1) {
			response.sendRedirect(request.getContextPath()+"/pages/index.do");
		} else {
			response.sendRedirect(request.getContextPath()+"/member/memberMyPage.do");
		}
	
}
		//
		//
		//
		//
		//
		//
		// 매니저 페이지 들어가는 구문 
		//
		//
		//
		//
		//
		//
		
		else if(command.equals("/member/memberManager.do")) {
			System.out.println("관리자페이지 들어옴");
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberManager.jsp");
			rd.forward(request, response);
			
		}else if(command.equals("member/memberManagerPage.do")){
			System.out.println("관리자페이지로 이동 ");
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberManager.jsp");
		}
		//
		//
		//
		//
		//
		//
		// 관리자 공지사항 들어가는 구문
		//
		//
		//
		//
		//
		//
		else if(command.equals("/member/memberManagerWrite.do")) {
			System.out.println("관리자 공지 글쓰기 페이지");
			HttpSession session = request.getSession();
//			if(session.getAttribute("midx")== null){
//				out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
//			}
//			
			 if(session.getAttribute("manager_id").equals("Y")){
				RequestDispatcher rd = request.getRequestDispatcher("/member/memberManagerWrite.jsp");
				rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("/member/memberMypage.do");
					rd.forward(request, response);
				}
		}
		else if(command.equals("/member/memberManagerWriteAction.do")) {
			System.out.println("공지사항 등록 완료!");
//			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			String ip = request.getParameter("ip");
		
			System.out.println(subject);
			System.out.println(content);
			System.out.println(writer);
			MemberDao md = new MemberDao();
			int value = md.insertBoard(subject, content, writer, ip, midx);

			if (value == 1) {
				
//				out.println("<script>alert('글 작성 완료 ');location.href='/a_board/boardList.do'");
//				out.flush();
				response.sendRedirect(request.getContextPath()+"/member/noticeList.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/member/memberManagerWrite.do");
			}
		
		}
		
		else if (command.equals("/member/memberManagerDeleteAction.do")) {
			System.out.println("공지사항 글 삭제 ㄱ ㄱ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);	
			BoardDao bd =  new BoardDao ();
			int value = bd.deleteBoard2(bidx_);
			
			if(value == 1) {
				response.sendRedirect(request.getContextPath()+"/member/noticeList.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/member/noticeList.do");
			}
		}
		else if(command.equals("/member/noticeModify.do")) {
			System.out.println("공지사항 글 수정 페이지 ");
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
		System.out.println(bidx);
			// 2. 처리함 
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne2(bidx_);

			request.setAttribute("bv", bv);   // 내부적으로 자원 공유 

			// 3.이동함 
			RequestDispatcher rd = request.getRequestDispatcher("/member/noticeModify.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/member/noticeModifyAction.do")) {
			System.out.println("공지사항 수정 ㄱ ㄱ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			String subject = request.getParameter("subject");
			System.out.println(bidx);
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			
			
			BoardDao bd = new BoardDao();
			System.out.println(subject);
			int value = bd.modifyNotice(subject, content, writer, bidx_);
			
			if(value ==1) {
				response.sendRedirect(request.getContextPath()+"/member/memberManagerContent.do?bidx="+bidx);
			}else {
				response.sendRedirect(request.getContextPath()+"/member/noticeModify.do");
			}
		}
		//
		//
		//
		//
		//
		//
		else if(command.equals("member/memberModifyAction.do")) {
			System.out.println("회원정보 수정 들어옴 ");
			HttpSession session = request.getSession();
			
			String midx = request.getParameter("midx");
			
			
			
		}
		else if (command.equals("/member/memberManagerContent.do")) {
			System.out.println("공지사항 게시글 내용 들어옴 ");
			
			HttpSession session = request.getSession();
			if(session.getAttribute("midx")== null){
				out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
			} else {
				// 1. parameter가 넘어옴 
				String bidx = request.getParameter("bidx");
				int bidx_ = Integer.parseInt(bidx);

				// 2. 처리함 
				BoardDao bd = new BoardDao();
				BoardVo bv = bd.boardSelectOne2(bidx_);

				request.setAttribute("bv", bv);   // 내부적으로 자원 공유 
				
				

				// 3. 이동함 
				RequestDispatcher rd = request.getRequestDispatcher("/member/memberManagerContent.jsp");
				rd.forward(request, response);
			}

			
			
		}
		else if(command.equals("/member/noticeList.do")) {
			System.out.println("공지사항 목록 ");
			HttpSession session = request.getSession();
			if(session.getAttribute("midx")== null){
				out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
			} else {
			
			BoardDao bd = new BoardDao();
			
			ArrayList<BoardVo> mlist = bd.boardSelectAll2();
			request.setAttribute("mlist", mlist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/noticeList.jsp");
			rd.forward(request, response);
			}
		}
		
		}
	
		
		
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

















