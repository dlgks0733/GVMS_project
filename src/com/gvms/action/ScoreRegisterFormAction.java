package com.gvms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ScoreRegisterFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/score/register.jsp";
		
		String stuID = request.getParameter("stuID");
		String stuName = request.getParameter("stuName");
		request.setAttribute("stuID", stuID);
		request.setAttribute("stuName", stuName);
		System.out.println("stuID : " + stuID +  " stuName : " + stuName);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
