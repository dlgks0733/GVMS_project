package com.gvms.action.Score;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreRegistAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "score?command=scoreListForm";
		
		String stuId = request.getParameter("stuId");
		request.setAttribute("stuId", stuId);
		
		ScoreVO scoVo = new ScoreVO();
				scoVo.setStuId(stuId);
		
		String row_cnt_s = request.getParameter("row_cnt");
						 request.setAttribute("row_cnt_s", row_cnt_s);
		int row_cnt = Integer.parseInt(row_cnt_s);
						 System.out.println(row_cnt);
		
		for(int i=1; i<=row_cnt; i++) {
			
			
			String subId = request.getParameter("subId_" + i);
						   request.setAttribute("subId", subId);
			String scoreDate = request.getParameter("scoreDate_" + i);
							   request.setAttribute("scoreDate", scoreDate);
			String acqScore = request.getParameter("acqScore_" + i);
							  request.setAttribute("acqScore", acqScore);
			
			System.out.println("subId: " + subId + " scoreDate: " + scoreDate + " acqScore: " + acqScore);
			
			scoVo.setSubId(subId);
			scoVo.setScoreDate(scoreDate);
			scoVo.setAcqScore(acqScore);
			
			ScoreDao scoDao = ScoreDao.getInstance();
			scoDao.insertScore(scoVo);
							  
			
		}
		

	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	    
	}

}
