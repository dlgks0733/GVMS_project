package com.gvms.action.Student;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String url = "/student?command=studentListForm";
		
		String stuId = request.getParameter("stuId");
		request.setAttribute("stuId", stuId);
		
		String stuName = request.getParameter("stuName");
		request.setAttribute("stuName", stuName);
		
		String stuStat = request.getParameter("stuStat");
		request.setAttribute("stuStat", stuStat);
		
		
		StudentVO stuVo = new StudentVO();
		stuVo.setStuId(stuId);
		stuVo.setStuName(stuName);
		stuVo.setStuStat(stuStat);
		
		StudentDao stuDao = StudentDao.getInstance();
		
//		request.setAttribute("studentVO", stuVo);
		
		stuDao.updateStudent(stuVo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	
}
}



