package com.gvms.action.Score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;



public class ScoreListRegFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/score/listReg.jsp";
		
		StudentDao stuDao = StudentDao.getInstance();
		ArrayList<StudentVO> list = stuDao.StudentList();
		request.setAttribute("list", list);
		
//		
//		StuListAction stuListAction = new StuListAction();
//		stuListAction.execute(request, response);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
