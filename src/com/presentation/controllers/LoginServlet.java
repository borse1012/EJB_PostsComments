package com.presentation.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("user-name", "");
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/login.jsp");
		view.forward(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<String> lstUser = new ArrayList<String>();
		lstUser.add("leon");
		lstUser.add("john");
		
		List<String> lstPass = new ArrayList<String>();
		lstPass.add("panag");
		lstPass.add("parker");

		request.setAttribute("errors", false);
		
		String username = request.getParameter("user");

		if (username.length() == 0 || !lstUser.contains(username)) {
			request.setAttribute("errors", true);
			request.setAttribute("username-error", true);
			request.setAttribute("user-name", "");
		} else {
			request.setAttribute("user-name", username);
		}
		
		String password = request.getParameter("pass");
		if (password.length() == 0 || !lstPass.contains(password)) {
			request.setAttribute("errors", true);
			request.setAttribute("password-error", true);
		}


		if ((Boolean) request.getAttribute("errors")) {
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/login.jsp");
			view.forward(request, response);
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("isValidSession",true);
			session.setAttribute("userName",username);
			session.setAttribute("userId",(lstUser.indexOf(username)+1));
			
			response.sendRedirect(request.getContextPath()+"/MemberServlet");
			
		}

	}

}
