package com.gvms.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentListFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String url = "/student/list.jsp";
				
				
				StudentDao dao = StudentDao.getInstance();
				
				ArrayList<StudentVO> studentList = dao.getStudentList();
				
				request.setAttribute("list", studentList);
				
				System.out.println(studentList);
				
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
		
		
	}

}
