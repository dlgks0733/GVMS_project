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
		
		String[] essIndex = request.getParameterValues("essIndex");
							request.setAttribute("essIndex", essIndex);
		String essIndexIndivi = "";
		
		String[] optIndex = request.getParameterValues("optIndex");
							request.setAttribute("optIndex", optIndex);
		String optIndexIndivi = "";
		
		if(essIndex != null) {
		
		for(int i = 0; i<essIndex.length; i++) {
			essIndexIndivi = essIndex[i];
			String essSubId = request.getParameter(essIndexIndivi+"essSubId");
							  request.setAttribute("essSubId", essSubId);
			String essScoreDate = request.getParameter(essIndexIndivi+"essScoreDate");
								  request.setAttribute("essScoreDate", essScoreDate);
			String essAcqScore = request.getParameter(essIndexIndivi+"essAcqScore");
								 request.setAttribute("essAcqScore", essAcqScore);
			String essScoreId = request.getParameter(essIndexIndivi+"essScoreId");
								request.setAttribute("essScoreId", essScoreId);
			
			System.out.println("essScoreId : " + essScoreId + " essSubId : " + essSubId + " essScoreDate : " + essScoreDate
							  + " essAcqScore : " + essAcqScore);
			
			ScoreVO scoVo = new ScoreVO();
			scoVo.setScoreId(essScoreId);
			scoVo.setSubId(essSubId);
			scoVo.setAcqScore(essAcqScore);
			scoVo.setScoreDate(essScoreDate);
			
			ScoreDao scoDao = ScoreDao.getInstance();
			scoDao.updateScore(scoVo);
			
			
		}
		}
		
		if(optIndex != null) {
		for(int i = 0; i<optIndex.length; i++) {
			optIndexIndivi = optIndex[i];
			String optSubId = request.getParameter(optIndexIndivi+"optSubId");
							  request.setAttribute("optSubId", optSubId);
			String optScoreDate = request.getParameter(optIndexIndivi+"optScoreDate");
								  request.setAttribute("optScoreDate", optScoreDate);
			String essAcqScore = null;
			
			String optScoreId = request.getParameter(optIndexIndivi+"optScoreId");
								request.setAttribute("optScoreId", optScoreId);
			
			System.out.println("optScoreId : " + optScoreId + " optSubId : " + optSubId + " optScoreDate : " + optScoreDate
							  + " essAcqScore : " + essAcqScore);
			
			ScoreVO scoVo = new ScoreVO();
			scoVo.setScoreId(optScoreId);
			scoVo.setSubId(optSubId);
			scoVo.setAcqScore(essAcqScore);
			scoVo.setScoreDate(optScoreDate);
			
			ScoreDao scoDao = ScoreDao.getInstance();
			scoDao.updateScore(scoVo);
			
			
		}
		}
		
		/*String[] scoreId = request.getParameterValues("scoreId");
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
			scoDao.updateScore(scoVo);
			
			
			
		}*/
		
		
		
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
