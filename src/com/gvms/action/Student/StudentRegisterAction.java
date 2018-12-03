package com.gvms.action.Student;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentRegisterAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/student?command=studentListForm";
		
		
		// 요청 된 jsp 에서 Parameter 가져오기
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String stuStat = request.getParameter("stuStat");
		
		// Parameter 출력
		System.out.println("stuId : " + stuId);
		System.out.println("stuName : " + stuName);
		System.out.println("stuStat : " + stuStat);
		
		// StudentVO 객체 생성
		StudentVO sVo = new StudentVO();
		
		
		// 객체 세팅
		sVo.setStuId(stuId);
		sVo.setStuName(stuName);
		sVo.setStuStat(stuStat);
		
		StudentDao sDao = StudentDao.getInstance();
		
		sDao.insertStudent(sVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}	
	
	
}
