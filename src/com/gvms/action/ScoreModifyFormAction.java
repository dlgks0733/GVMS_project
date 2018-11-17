package com.gvms.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreModifyFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/score/modify.jsp";
		
		
		
		String stuId = request.getParameter("stuId");
		request.setAttribute("stuId", stuId);
		String stuName = request.getParameter("stuName");
		request.setAttribute("stuName", stuName);
		
		System.out.println(stuId + " " + stuName);
		
	    ScoreDao scoDao = ScoreDao.getInstance();
		ArrayList<ScoreVO> optList = scoDao.ScoreOptList(stuId);
		request.setAttribute("optList", optList);
		
		ArrayList<ScoreVO> essList = scoDao.ScoreEssList(stuId);
		request.setAttribute("essList", essList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
