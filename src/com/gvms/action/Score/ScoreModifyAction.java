package com.gvms.action.Score;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "score?command=scoreListForm";

		String[] scoreId = request.getParameterValues("scoreId");
		String scoreIndivi = "";
		request.setAttribute("scoreId", scoreId);
		
		for(int i = 0; i< scoreId.length; i++) {
			scoreIndivi = scoreId[i];
			
			String subId = request.getParameter(scoreIndivi+"subId");
			request.setAttribute("subId", subId);
			
			String scoreDate = request.getParameter(scoreIndivi+"scoreDate");
			request.setAttribute("scoreDate", scoreDate);
			
			String acqScore = request.getParameter(scoreIndivi+"acqScore");
			request.setAttribute("acqScore", acqScore);
			
			System.out.println( "scoreId:" + scoreIndivi + " subId:"+subId + " scoreDate:" 
								+ scoreDate  + " acqScore:" + acqScore);
			
			ScoreVO scoVo = new ScoreVO();
			scoVo.setSubId(subId);
			scoVo.setScoreDate(scoreDate);
			scoVo.setAcqScore(acqScore);
			scoVo.setScoreId(scoreIndivi);
			
			ScoreDao scoDao = ScoreDao.getInstance();
//			scoDao.updateScore(scoVo);
			
			
			
		}
		
		
		
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
