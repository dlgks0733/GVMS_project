package com.gvms.action;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentModifyFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/student/modify.jsp";
		
		String stuId = request.getParameter("stuId");
		request.setAttribute("stuId", stuId);
		

		
		System.out.println("stuId" + stuId );
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}
	

}
