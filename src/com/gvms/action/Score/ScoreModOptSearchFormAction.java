package com.gvms.action.Score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;
import com.gvms.vo.SubjectVO;

public class ScoreModOptSearchFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/score/modifyOptSubSearch.jsp";
		String index = request.getParameter("index");
		request.setAttribute("index", index);
		System.out.println("index : " +  index);
		
		ScoreDao scoDao = ScoreDao.getInstance();
		ArrayList<ScoreVO> allOptList = scoDao.allOptSubject();
		request.setAttribute("allOptList", allOptList);

		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
		
	}

}
