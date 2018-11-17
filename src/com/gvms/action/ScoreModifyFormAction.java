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
		
		
		
		String stu_id = request.getParameter("stu_id");
		request.setAttribute("stu_id", stu_id);
		String stu_name = request.getParameter("stu_name");
		request.setAttribute("stu_name", stu_name);
		
		System.out.println(stu_id + " " + stu_name);
		
	    ScoreDao scoDao = ScoreDao.getInstance();
		ArrayList<ScoreVO> optList = scoDao.ScoreOptList(stu_id);
		request.setAttribute("optList", optList);
		
		ArrayList<ScoreVO> essList = scoDao.ScoreEssList(stu_id);
		request.setAttribute("essList", essList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
