package com.gvms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "score?command=scoreListForm";

		String[] scoreId = request.getParameterValues("scoreId");
		String scoreIdIndivi = "";
		
		String[] essSubId = request.getParameterValues("essSubId");
		String essSubIdIndivi = "";
		
		String[] optSubId = request.getParameterValues("optSubId");
		String optSubIdIndivi = "";
		
		String[] acqScore = request.getParameterValues("acqScore");
		String acqScoreIndivi ="";
		
		String[] scoreDate = request.getParameterValues("scoreDate");
		String scoreDateIndivi ="";
		
		for(int i = 0; i < scoreId.length; i++) {
		System.out.println("scoreId : " + scoreId[i]);
		scoreIdIndivi = scoreId[i];
		essSubIdIndivi = essSubId[i];
		optSubIdIndivi = optSubId[i];
		acqScoreIndivi = acqScore[i];
		scoreDateIndivi = scoreDate[i];
		
		System.out.println("scoreIdIndivi : " + scoreIdIndivi + " essSubIdIndivi : " + essSubIdIndivi + " optSubIdIndivi : "+ optSubIdIndivi + 
				" acqScoreIndivi : " + acqScoreIndivi + " scoreDateIndivi : " + scoreDateIndivi);
		
		ScoreVO scoVo = new ScoreVO();
		ScoreDao scoDao = ScoreDao.getInstance();
		
		if(essSubId != null) {
			scoVo.setScoreId(scoreIdIndivi);
			scoVo.setSubId(essSubIdIndivi);
			scoVo.setAcqScore(acqScoreIndivi);
			scoVo.setScoreDate(scoreDateIndivi);
			//scoDao.updateScore(scoVo);
		} else {
			scoVo.setScoreId(scoreIdIndivi);
			scoVo.setSubId(optSubIdIndivi);
			scoVo.setAcqScore(acqScoreIndivi);
			scoVo.setScoreDate(scoreDateIndivi);
			//scoDao.updateScore(scoVo);
		} 
		
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
