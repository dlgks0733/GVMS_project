package com.gvms.action.Student;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentModifyFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/student/modify.jsp";
		
		String stuId = request.getParameter("stuId");
		request.setAttribute("stuId", stuId);
		
		String stuName = request.getParameter("stuName");
		request.setAttribute("stuName", stuName);
		
		String stuStat = request.getParameter("stuStat");
		request.setAttribute("stuStat", stuStat);
		
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}
	

}
