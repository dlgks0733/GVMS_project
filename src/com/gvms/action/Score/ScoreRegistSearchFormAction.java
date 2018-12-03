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

public class ScoreRegistSearchFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/score/registSearch.jsp";
		String index = request.getParameter("index");
		request.setAttribute("p_index", index);
		
		ScoreDao scoDao = ScoreDao.getInstance();
		ArrayList<ScoreVO> allSubList = scoDao.selectAllSubList();
		request.setAttribute("allSubList", allSubList);
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	}

}
