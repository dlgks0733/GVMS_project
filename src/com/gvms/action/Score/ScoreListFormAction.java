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



public class ScoreListFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/score/list.jsp";
		
//		StuListAction stuListAction = new StuListAction();
//		stuListAction.execute(request, response);

		StudentDao stuDao = StudentDao.getInstance();
		ArrayList<StudentVO> totalList = stuDao.StudentTotalList();
		request.setAttribute("totalList", totalList);
		
		
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
