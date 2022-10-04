package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import domain.BoardVo;
import domain.SearchCriteria;
import domain.PageMaker;
import service.BoardDao;
import service.BoardDao2;
import service.BoardDao3;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//가상경로 추출 
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		
		 
		//mac 은 파일 업로드 경로를 / 로 한다. 윈도우는 \\ 이지만 맥은 /
		// 파일 업로드 장소 
//		String uploadPath = "/Users/gimbeomjun/abc/eclipse/projectFile/src/main/webapp/";
		String uploadPath = "/Users/gimbeomjun/eclipse-workspace/projectFile/src/main/webapp/";
		String saveFolder = "images";
		String saveFullPath = uploadPath+saveFolder;
		
		if(command.equals("/a_board/boardWrite.do")) {
			System.out.println("구매글 작성 들어옴 ");
			RequestDispatcher rd= request.getRequestDispatcher("/a_board/boardWrite.jsp");
			rd.forward(request, response);
		}else if (command.equals("/a_board/boardWriteAction.do")) {
			System.out.println("구매글 작성 완료 ");
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String writer = multi.getParameter("writer");
			
			//열거자에 저장될 파일을 담는 객체를 생성한다.
			
			Enumeration files =  multi.getFileNames();
			// 담긴 파일 객체의 파일 이름을 얻는다.
			
			String file = (String)files.nextElement();
			//저장되는 파일 이름 
			String fileName = multi.getFilesystemName(file);
			//원래 파일 이름 
			String originFileName = multi.getOriginalFileName(file);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.insertBoard(subject, content, writer, ip, midx);

			if (value == 1) {
				
//				out.println("<script>alert('글 작성 완료 ');location.href='/a_board/boardList.do'");
//				out.flush();
				response.sendRedirect(request.getContextPath()+"/a_board/boardList.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/a_board/boardWrite.do");
			}
		} else if(command.equals("/a_board/boardList.do")) {
			System.out.println("a_board 사용 게시글 리스트 들어옴 ");
			
			String page = request.getParameter("page");
			if(page == null) {
				page= "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword =request.getParameter("keyword");
			if(keyword == null) {keyword="";}
			String searchType = request.getParameter("searchType");
			if(searchType==null) {searchType="subject";}
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			scri.setSearchType(searchType);
			
			//처
			BoardDao bd = new BoardDao();
			int cnt = bd.boardTotal(scri);
			System.out.println("사용 글 총 갯수 : "+cnt);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			
			
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			
			request.setAttribute("alist", alist);  			// 데이터(자원) 공유 
			
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> mlist = bd.boardSelectAll2();
			request.setAttribute("mlist", mlist);
			
			
			//페이지 이동 
			RequestDispatcher rd= request.getRequestDispatcher("/a_board/boardList.jsp");
			rd.forward(request, response);
		} else if (command.equals("/a_board/boardContent.do")) {
			System.out.println("a_board 사용 게시글 내용 들어옴 ");
			HttpSession session = request.getSession();
			if(session.getAttribute("midx")== null){
				out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
			} else {
				// 1. parameter가 넘어옴 
				String bidx = request.getParameter("bidx");
				int bidx_ = Integer.parseInt(bidx);

				// 2. 처리함 
				BoardDao bd = new BoardDao();
				BoardVo bv = bd.boardSelectOne(bidx_);

				request.setAttribute("bv", bv);   // 내부적으로 자원 공유 
				
				

				// 3. 이동함 
				RequestDispatcher rd = request.getRequestDispatcher("/a_board/boardContent.jsp");
				rd.forward(request, response);
			}

			
			
		}else if (command.equals("/a_board/boardModify.do")){
			System.out.println("사용 게시판 글수정 들어옴  ");
		
			// 1. parameter가 넘어옴 
						String bidx = request.getParameter("bidx");
						int bidx_ = Integer.parseInt(bidx);

						// 2. 처리함 
						BoardDao bd = new BoardDao();
						BoardVo bv = bd.boardSelectOne(bidx_);

						request.setAttribute("bv", bv);   // 내부적으로 자원 공유 

						// 3.이동함 
						RequestDispatcher rd = request.getRequestDispatcher("/a_board/boardModify.jsp");
						rd.forward(request, response);
						
		}else if (command.equals("/a_board/boardModifyAction.do")) {
			
			System.out.println("사용 게시글 수정 됨 ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			BoardDao bd = new BoardDao();
			int value = bd.modifyBoard(subject, content, writer, bidx_);
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath()+"/a_board/boardContent.do?bidx="+bidx);
			} else {
				response.sendRedirect(request.getContextPath()+"/a_board/boardModify.do");
			}
			
		}else if (command.equals("/a_board/boardDelete.do")) {
			System.out.println("사용 게시글 삭제 들어옴 ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne(bidx_);

			request.setAttribute("bv", bv);  
			
			RequestDispatcher rd = request.getRequestDispatcher("/a_board/boardDelete.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/a_board/boardDeleteAction.do")) {
			
				System.out.println("사용 게시글 삭제 됨  a_board");
				
				
				
				String bidx = request.getParameter("bidx");
				System.out.println("bidx"+bidx);
				
				int bidx_ = Integer.parseInt(bidx);				
				BoardDao bd = new BoardDao();
				int value = bd.deleteBoard(bidx_);
			
				if (value == 1) {
					response.sendRedirect(request.getContextPath()+"/a_board/boardList.do");
				} else {
					response.sendRedirect(request.getContextPath()+"/a_board/boardDelete.do");
				}
			
		}else if (command.equals("/a_board/boardReply.do")) {
			System.out.println("사용 글 답변 페이지 들어옴 ");
			
			//넘겨야할 목록들 
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
//		System.out.println(bidx);
//		System.out.println(originbidx);
//		System.out.println(depth);
//		System.out.println(level_);
			
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			
			request.setAttribute("bv", bv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/a_board/boardReply.jsp");
			rd.forward(request, response);
			
		}else if (command.equals("/a_board/boardReplyAction.do")) {
			System.out.println("사용 글 답변완료 ");
			
			
			//넘겨야 할 목록들 
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			

			String ip = request.getParameter("ip");
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			//처리하는 부분에서 bv를 사용하기에 bv를 객체생성하고 담는다.
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setWriter(writer);
			bv.setIp(ip);
			bv.setMidx(midx);
			
			
			
			// 처리하는 부분 
			BoardDao bd = new BoardDao();
			bd.replyBoard(bv);
			int value = bd.replyBoard(bv);
			
			if(value == 1) {
				response.sendRedirect(request.getContextPath()+"/a_board/baordList.do");
				
				
			} else {
				response.sendRedirect(request.getContextPath()+"/a_board/boardContent.do?bidx="+bidx);	
			}
			
			
		}
//			else if(command.equals("/a_board/fileDownload.do")) {
//			
//			//파일이름을 넘겨받는다.
//			String filename = request.getParameter("filename");
//			//파일의 전체 경로 
//			String filePath = saveFullPath + File.separator+filename;
//			
//			
//			//해당위치에 있는 파일을 읽어 들인다.
//			FileInputStream fileInputStream = new FileInputStream(filePath);
//			
//			Path source = Paths.get(filePath);
//			String mimeType = Files.probeContentType(source);
//			//헤더 정보에 추출한 파일 형식을 담는다.
//			response.setContentType(mimeType);
//			
//			String sEncoding = new String(filename.getBytes("UTF-8"));
//			//헤더정보에 파일이름을 담는다.
//			response.setHeader("Content-Disposition","attachment;fileName="+ sEncoding);
//			
//			//파일쓰기 
//			ServletOutputStream servletOutStream = response.getOutputStream();
//			byte[] b = new byte[4096];
//			int read = 0;
//			while((read = fileInputStream.read(b, 0, b.length))!=-1) {
//				servletOutStream.write(b, 0, read);
//			}
//			
//			servletOutStream.flush();
//			servletOutStream.close();
//			fileInputStream.close();
//			
//			
//			
//		}
		//
		//
		// b_board 
		//
		//
		else if(command.equals("/b_board/boardWrite.do")) {
			System.out.println("구매 글 작성 페이지 ");
			
			RequestDispatcher rd= request.getRequestDispatcher("/b_board/boardWrite.jsp");
			rd.forward(request, response);
		}else if (command.equals("/b_board/boardWriteAction.do")) {
			System.out.println("구매 글 작성 완료 ");
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String writer = multi.getParameter("writer");
			
			//열거자에 저장될 파일을 담는 객체를 생성한다.
			Enumeration files =  multi.getFileNames();
			//담긴 파일 객체의 파일 이름을 얻는다.
			String file = (String)files.nextElement();
			//저장되는 파일 이름 
			String fileName = multi.getFilesystemName(file);
			//원래 파일 이름 
			String originFileName = multi.getOriginalFileName(file);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			BoardDao2 bd = new BoardDao2();
			int value = bd.insertBoard(subject, content, writer, ip, midx);

			if (value == 1) {
				response.sendRedirect(request.getContextPath()+"/b_board/boardList.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/b_board/boardWrite.do");
			}
		} else if(command.equals("/b_board/boardList.do")) {
			System.out.println("b_board 구매 글 리스트 들어옴 ");
			
			String page = request.getParameter("page");
			if(page == null) {
				page= "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword =request.getParameter("keyword");
			if(keyword == null) {keyword="";}
			String searchType = request.getParameter("searchType");
			if(searchType==null) {searchType="subject";}
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			scri.setSearchType(searchType);
			
			//처리 
			BoardDao2 bd = new BoardDao2();
			int cnt = bd.boardTotal(scri);
			System.out.println("구매 게시글 총 갯수 :  "+cnt);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			
			
			
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			request.setAttribute("alist", alist);  			// 데이터(자원) 공유 
			request.setAttribute("pm", pm);
			ArrayList<BoardVo> mlist = bd.boardSelectAll2();
			request.setAttribute("mlist", mlist);
			
			
			
			//페이지 이동 
			RequestDispatcher rd= request.getRequestDispatcher("/b_board/boardList.jsp");
			rd.forward(request, response);
		} else if (command.equals("/b_board/boardContent.do")) {
			System.out.println("b_board 구매 글 작성 들어옴 ");
			HttpSession session = request.getSession();
			if(session.getAttribute("midx")== null){
				out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
			} else {
			// 1. parameter가 넘어옴.
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			// 2. 처리함 
			BoardDao2 bd = new BoardDao2();
			BoardVo bv = bd.boardSelectOne(bidx_);

			request.setAttribute("bv", bv);   // 내부적으로 자원 공유 

			// 3. 이동함 
			RequestDispatcher rd = request.getRequestDispatcher("/b_board/boardContent.jsp");
			rd.forward(request, response);
			}
			
		}else if (command.equals("/b_board/boardModify.do")){
			System.out.println("b_board 글 수정 들어옴 ");
		
			// 1. parameter가 넘어옴 
						String bidx = request.getParameter("bidx");
						int bidx_ = Integer.parseInt(bidx);

						// 2. 처리함 
						BoardDao2 bd = new BoardDao2();
						BoardVo bv = bd.boardSelectOne(bidx_); 

						request.setAttribute("bv", bv);   // 내부적으로 자원 공유 

						// 3. 이동함 
						RequestDispatcher rd = request.getRequestDispatcher("/b_board/boardModify.jsp");
						rd.forward(request, response);
						
		}else if (command.equals("/b_board/boardModifyAction.do")) {
			
			System.out.println("구매 게시글  수정 됨 ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			System.out.println(bidx);
			
			
			BoardDao2 bd = new BoardDao2();
			int value = bd.modifyBoard(subject, content, writer, bidx_);
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath()+"/b_board/boardContent.do?bidx="+bidx);
			} else {
				response.sendRedirect(request.getContextPath()+"/b_board/boardModify.do");
			}
			
		}else if (command.equals("/b_board/boardDelete.do")) {
			System.out.println("b_board 구매 글 삭제 들어옴 ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			BoardDao2 bd = new BoardDao2();
			BoardVo bv = bd.boardSelectOne(bidx_);

			request.setAttribute("bv", bv);  
			
			RequestDispatcher rd = request.getRequestDispatcher("/b_board/boardDelete.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/b_board/boardDeleteAction.do")) {
			
				System.out.println("구매 글 삭제  b_board");
				
				
				
				String bidx = request.getParameter("bidx");
				int bidx_ = Integer.parseInt(bidx);				
				BoardDao2 bd = new BoardDao2();
				int value = bd.deleteBoard(bidx_);
			
				if (value == 1) {
					response.sendRedirect(request.getContextPath()+"/b_board/boardList.do");
				} else {
					response.sendRedirect(request.getContextPath()+"/b_board/boardDelete.do");
				}
			
		}else if (command.equals("/b_board/boardReply.do")) {
			System.out.println("b_board 답변 페이지 들어옴 ");
			
			//넘겨야할 목록들 
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
//		System.out.println(bidx);
//		System.out.println(originbidx);
//		System.out.println(depth);
//		System.out.println(level_);
			
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			
			request.setAttribute("bv", bv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/b_board/boardReply.jsp");
			rd.forward(request, response);
			
		}else if (command.equals("/b_board/boardReplyAction.do")) {
			System.out.println("b_board 구매 글 답변 완료 ");
			
			
			//넘겨야할 목록들 
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			

			String ip = request.getParameter("ip");
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			// 처리하는 부분에서 bv를 사용하기에 bv를 객체생성하고 담는다.
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setWriter(writer);
			bv.setIp(ip);
			bv.setMidx(midx);
			
			
			
			// 처리하는 부분 
			BoardDao2 bd = new BoardDao2();
			bd.replyBoard(bv);
			int value = bd.replyBoard(bv);
			
			if(value == 1) {
				response.sendRedirect(request.getContextPath()+"/b_board/baordList.do");
				
				
			} else {
				response.sendRedirect(request.getContextPath()+"/b_board/boardContent.do?bidx="+bidx);	
			}
			
			
		}else if(command.equals("/b_board/fileDownload.do")) {
			
			//파일이름을 넘겨받는다.
			String filename = request.getParameter("filename");
			//파일의 전체 경로 
			String filePath = saveFullPath + File.separator+filename;
			
			
			//해당위치에 있는 파일을 읽어 들인다.
			FileInputStream fileInputStream = new FileInputStream(filePath);
			
			Path source = Paths.get(filePath);
			String mimeType = Files.probeContentType(source);
			//헤더 정보에  추출한 파일 형식을 담는다.
			response.setContentType(mimeType);
			
			String sEncoding = new String(filename.getBytes("UTF-8"));
			//�헤더정보에 파일이름을 담는다.
			response.setHeader("Content-Disposition","attachment;fileName="+ sEncoding);
			
			//파일쓰기 
			ServletOutputStream servletOutStream = response.getOutputStream();
			byte[] b = new byte[4096];
			int read = 0;
			while((read = fileInputStream.read(b, 0, b.length))!=-1) {
				servletOutStream.write(b, 0, read);
			}
			
			servletOutStream.flush();
			servletOutStream.close();
			fileInputStream.close();
			
			
			
		}//
		//
		// c_board 
		//
		//
		else if(command.equals("/c_board/boardWrite.do")) {
			System.out.println("질문 글 작성 페이지 ");
			RequestDispatcher rd= request.getRequestDispatcher("/c_board/boardWrite.jsp");
			rd.forward(request, response);
		}else if (command.equals("/c_board/boardWriteAction.do")) {
			System.out.println("질문 글 작성 완료 ");
			
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String writer = multi.getParameter("writer");
			
			//열거자에 저장될 파일을 담는 객체를 생성한다. 
			Enumeration files =  multi.getFileNames();
			//담긴 파일 객체의 파일 이름을 얻는다. 
			String file = (String)files.nextElement();
			//저장되는 파일 이름 
			String fileName = multi.getFilesystemName(file);
			//원래 파일 이름 
			String originFileName = multi.getOriginalFileName(file);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			BoardDao3 bd = new BoardDao3();
			int value = bd.insertBoard(subject, content, writer, ip, midx);

			if (value == 1) {
				response.sendRedirect(request.getContextPath()+"/c_board/boardList.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/c_board/boardWrite.do");
			}
		} else if(command.equals("/c_board/boardList.do")) {
			System.out.println("질문 글 리스트 ");
			System.out.println("c_board 리스트 들어옴 ");
			
			String page = request.getParameter("page");
			if(page == null) {
				page= "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword =request.getParameter("keyword");
			if(keyword == null) {keyword="";}
			String searchType = request.getParameter("searchType");
			if(searchType==null) {searchType="subject";}
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			scri.setSearchType(searchType);
			
			//처리 
			BoardDao3 bd = new BoardDao3();
			int cnt = bd.boardTotal(scri);
			System.out.println("질문 글 총 갯수 : "+cnt);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			
		
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			request.setAttribute("alist", alist);  			// 데이터(자원) 공유 
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> mlist = bd.boardSelectAll2();
			request.setAttribute("mlist", mlist);
			
			//페이지 이동 
			RequestDispatcher rd= request.getRequestDispatcher("/c_board/boardList.jsp");
			rd.forward(request, response);
		} else if (command.equals("/c_board/boardContent.do")) {
			System.out.println("c_board 질문 게시글 들어옴");
			HttpSession session = request.getSession();
			if(session.getAttribute("midx")== null){
				out.println("<script>alert('로그인 해주시기 바랍니다.');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
			} else {
			// 1. parameter가 넘어옴 
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			// 2. 처리함 
			BoardDao3 bd = new BoardDao3();
			BoardVo bv = bd.boardSelectOne(bidx_);

			request.setAttribute("bv", bv);   // 내부적으로 자원 공유 

			// 3. 이동함 
			RequestDispatcher rd = request.getRequestDispatcher("/c_board/boardContent.jsp");
			rd.forward(request, response);
			}
			
		}else if (command.equals("/c_board/boardModify.do")){
			System.out.println("c_board 질문 글 수정 들어옴");
		
			// 1. parameter가 넘어옴 
						String bidx = request.getParameter("bidx");
						int bidx_ = Integer.parseInt(bidx);

						// 2. 처리함 
						BoardDao3 bd = new BoardDao3();
						BoardVo bv = bd.boardSelectOne(bidx_); 

						request.setAttribute("bv", bv);   // 내부적으로 자원 공유 

						// 3. 이동함 
						RequestDispatcher rd = request.getRequestDispatcher("/c_board/boardModify.jsp");
						rd.forward(request, response);
						
		}else if (command.equals("/c_board/boardModifyAction.do")) {
			
			System.out.println("c_board 질문 글 수정 됨 ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			BoardDao3 bd = new BoardDao3();
			int value = bd.modifyBoard(subject, content, writer, bidx_);
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath()+"/c_board/boardContent.do?bidx="+bidx);
			} else {
				response.sendRedirect(request.getContextPath()+"/c_board/boardModify.do");
			}
			
		}else if (command.equals("/c_board/boardDelete.do")) {
			System.out.println("c_board 질문 글 삭제 들어옴 ");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			BoardDao3 bd = new BoardDao3();
			BoardVo bv = bd.boardSelectOne(bidx_);

			request.setAttribute("bv", bv);  
			
			RequestDispatcher rd = request.getRequestDispatcher("/c_board/boardDelete.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/c_board/boardDeleteAction.do")) {
			
				System.out.println("질문 게시글 삭제 됨 c_board");
				
				
				
				String bidx = request.getParameter("bidx");
				int bidx_ = Integer.parseInt(bidx);				
				BoardDao3 bd = new BoardDao3();
				int value = bd.deleteBoard(bidx_);
			
				if (value == 1) {
					response.sendRedirect(request.getContextPath()+"/c_board/boardList.do");
				} else {
					response.sendRedirect(request.getContextPath()+"/c_board/boardDelete.do");
				}
			
		}else if (command.equals("/c_board/boardReply.do")) {
			System.out.println("c_board 질문 글 답변 페이지 들어옴 ");
			
			//�Ѱܾ��� ��ϵ� ��
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
//		System.out.println(bidx);
//		System.out.println(originbidx);
//		System.out.println(depth);
//		System.out.println(level_);
			
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			
			request.setAttribute("bv", bv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/c_board/boardReply.jsp");
			rd.forward(request, response);
			
		}else if (command.equals("/c_board/boardReplyAction.do")) {
			System.out.println("c_board 질문 게시글 답변 완료 ");
			
			
			//�Ѱܾ��� ��ϵ� ���
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			

			String ip = request.getParameter("ip");
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			// 처리하는 부분에서 bv를 사용하기에 bv를 객체생성하고 담는다. 
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setWriter(writer);
			bv.setIp(ip);
			bv.setMidx(midx);
			
			
			
			// 처리하는 부분 
			BoardDao3 bd = new BoardDao3();
			bd.replyBoard(bv);
			int value = bd.replyBoard(bv);
			
			if(value == 1) {
				response.sendRedirect(request.getContextPath()+"/c_board/baordList.do");
				
				
			} else {
				response.sendRedirect(request.getContextPath()+"/c_board/boardContent.do?bidx="+bidx);	
			}
			
			
		}else if(command.equals("/c_board/fileDownload.do")) {
			
			//파일이름을 넘겨받는다.
			String filename = request.getParameter("filename");
			//파일의 전체 경로 
			String filePath = saveFullPath + File.separator+filename;
			
			
			//해당위치에 있는 파일을 읽어 들인다.
			FileInputStream fileInputStream = new FileInputStream(filePath);
			
			Path source = Paths.get(filePath);
			String mimeType = Files.probeContentType(source);
			//헤더 정보에 추출한 파일 형식을 담는다. 
			response.setContentType(mimeType);
			
			String sEncoding = new String(filename.getBytes("UTF-8"));
			//헤더정보에 파일이름을 담는다.
			response.setHeader("Content-Disposition","attachment;fileName="+ sEncoding);
			
			//파일쓰기 
			ServletOutputStream servletOutStream = response.getOutputStream();
			byte[] b = new byte[4096];
			int read = 0;
			while((read = fileInputStream.read(b, 0, b.length))!=-1) {
				servletOutStream.write(b, 0, read);
			}
			
			servletOutStream.flush();
			servletOutStream.close();
			fileInputStream.close();
			
			
			
		}else if(command.equals("/c_board/boardWrite.do")) {
			RequestDispatcher rd= request.getRequestDispatcher("/c_board/boardWrite.jsp");
			rd.forward(request, response);
		}else if(command.equals("/c_board/boardList.do")) {
			
			RequestDispatcher rd= request.getRequestDispatcher("/c_board/boardList.jsp");
			rd.forward(request, response);
		}
//		else if(command.equals("/pages/noticeList.do")) {
//			System.out.println("공지사항 페이지 ");
//			RequestDispatcher rd = request.getRequestDispatcher("/member/noticeList.jsp");
//			rd.forward(request, response);
//		}
		
		
		//
		//
		//
		//
		//
		// 공지사항 글 내용 보기
		//
		//
		//
		//
		//
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
		
		
	}

}


















