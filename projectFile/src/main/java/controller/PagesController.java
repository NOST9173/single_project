package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PagesController")
public class PagesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
 
	if(command.equals("/pages/boardPages.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/boardPages.jsp");
		rd.forward(request, response);
	}else if(command.equals("/pages/applePage.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/applePage.jsp");
		rd.forward(request, response);
	}else if(command.equals("/pages/samsungPage.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/samsungPage.jsp");
		rd.forward(request, response);
	}else if(command.equals("/pages/LGPage.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/LGPage.jsp");
		rd.forward(request, response);
	}else if(command.equals("/pages/customerSupport.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/customerSupport.jsp");
		rd.forward(request, response);
	}else if(command.equals("/pages/search.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/search.jsp");
		rd.forward(request, response);
	}else if(command.equals("/pages/index.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/index.jsp");
		rd.forward(request, response);
	}else if(command.equals("/pages/email.do")) {
		RequestDispatcher rd= request.getRequestDispatcher("/pages/email.jsp");
		rd.forward(request, response);
	}
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
