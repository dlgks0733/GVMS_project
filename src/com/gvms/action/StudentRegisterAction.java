package com.gvms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentRegisterAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/student?command=studentListForm";
		
		
		// 요청 된 jsp 에서 Parameter 가져오기
		String stuID = request.getParameter("stuID");
		String stuName = request.getParameter("stuName");
		String stuStat = request.getParameter("stuStat");
		
		// Parameter 출력
		System.out.println("stuID : " + stuID);
		System.out.println("stuID : " + stuName);
		System.out.println("stuID : " + stuStat);
		
		// StudentVO 객체 생성
		StudentVO sVo = new StudentVO();
		
		// 객체 세팅
		sVo.setStuId(stuID);
		sVo.setStuName(stuName);
		sVo.setStuStat(stuStat);
		
		StudentDao sDao = StudentDao.getInstance();
		
		sDao.insertStudent(sVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}	
	
	
}
