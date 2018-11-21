package com.gvms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "score?command=scoreListForm";
		String[] scoreId = request.getParameterValues("scoreId");
		String scoreIndivi = "";
		request.setAttribute("scoreId", scoreId);
		
		for(int i = 0; i< scoreId.length; i++) {
			System.out.println("scoreId : " + scoreId[i]);
			scoreIndivi = scoreId[i];
			
			ScoreVO scoVo = new ScoreVO();
			scoVo.setScoreId(scoreIndivi);
			
			ScoreDao scoDao = ScoreDao.getInstance();
			scoDao.deleteScore(scoVo);
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
		
	}

}
