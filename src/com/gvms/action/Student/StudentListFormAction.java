package com.gvms.action.Student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.MisDAO;
import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentListFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String url = "/student/list.jsp";
				
//				//요청 된 jsp에서 Parameter 가져오기
//				//체크박스를 위한 stuId 배열로 생성
//				String[] stuId = request.getParameterValues("stuId");
//				String scoreDate = request.getParameter("scoreDate");
//				
//				//학번 배열 체크하는 stuIdIndivi 생성
//				String stuIdIndivi ="";
//				//MisVo 객체 생성
//			
//				StudentDAO stuDao = StudentDAO.getInstance();
//				
//				for(int i=0; i<stuId.length; i++) {
//					
//					System.out.println("stuId : " + stuId[i]);
//					stuIdIndivi = stuId[i];
				////////////////////////////////
				
				StudentDao dao = StudentDao.getInstance();
				
				ArrayList<StudentVO> studentList = dao.getStudentList();
				
				request.setAttribute("list", studentList);
				
				System.out.println(studentList);
				
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
		
		
	}

}
