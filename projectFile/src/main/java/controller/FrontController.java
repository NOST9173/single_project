package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI(); 
		String pj= request.getContextPath();
		// 전체 경로에서 프로젝트 이름을 뺀 나머지 가상경 
		
		String command= uri.substring(pj.length());
		//ex) /member/memberList.do
		
		String[] subpath = command.split("/");
		String location = subpath[1];  // 2번째 문자열 추출  ex) /member/memberList.do 중 member 추출 
		
		if(location.equals("member")) {
			MemberController mc = new MemberController();
			mc.doGet(request, response);
		}else if(location.equals("pages")) {
			PagesController pc = new PagesController();
			pc.doGet(request, response);
		}else if(location.equals("a_board")) {
			BoardController bc = new BoardController();
			bc.doGet(request, response);
		}else if(location.equals("b_board")) {
			BoardController bc = new BoardController();
			bc.doGet(request, response);
		}else if(location.equals("c_board")) {
			BoardController bc = new BoardController();
			bc.doGet(request, response);
		} else if(location.equals("board")) {
			BoardController bc = new BoardController();
			bc.doGet(request, response);
		}
		
	
	
	
	
	}
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
