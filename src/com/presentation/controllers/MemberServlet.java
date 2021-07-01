package com.presentation.controllers;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.business.service.PostsBean;
import com.google.gson.Gson;
import com.presentation.entity.Comment;
import com.presentation.entity.Posts;


@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	@EJB
	PostsBean postBean;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Member servlet - GET call- loading member jsp");
		
		HttpSession session=request.getSession();
		boolean isValidSession = false ;
		if(session.getAttribute("isValidSession") != null)
		isValidSession = (Boolean) session.getAttribute("isValidSession");
		
		request.setAttribute("result", false);
		if(isValidSession)
			request.getRequestDispatcher("/WEB-INF/views/member.jsp").forward(request,response);
		else
			response.sendRedirect(request.getContextPath()+"/LoginServlet");
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Member servlet - POST call- getting details");
		
		HttpSession session=request.getSession();
		boolean isValidSession = false ;
		if(session.getAttribute("isValidSession") != null)
		isValidSession = (Boolean) session.getAttribute("isValidSession");
		if(!isValidSession)
			response.sendRedirect(request.getContextPath()+"/LoginServlet");
		
		String queryType = request.getParameter("queryType");
		System.out.println(" Member Query "+queryType);
		
		String userId = "9";
		if(session.getAttribute("userId")!=null)	
			userId = ""+session.getAttribute("userId");
		
		String result = "";
		boolean isResult = false;
		
		Gson gson = new Gson();
		
		if(queryType != null && queryType.equals("POSTS")) {
			result = postBean.getPostByUserId(userId);

			if(result != null) {
				Posts posts = gson.fromJson(result, Posts.class);
				posts.setUserId(userId);
				request.setAttribute("postData", posts);
			}
			
			isResult = true;
			
		}else if(queryType != null && queryType.equals("COMMENTS")) {
			result = postBean.getCommentsByUserId(userId);
			Comment [] comments = gson.fromJson(result, Comment[].class);
			request.setAttribute("commentsData", comments);
			isResult = true;
			
		}else if(queryType != null && queryType.equals("LOGOUT")) {
			session.setAttribute("isValidSession",false);
			response.sendRedirect(request.getContextPath()+"/LoginServlet");
		}else {
			System.out.println("Invalid Member Query "+queryType);
		}
		
		request.setAttribute("result", isResult);
		request.setAttribute("result-str", result);

		request.getRequestDispatcher("/WEB-INF/views/member.jsp").forward(request,response);
	}

}
