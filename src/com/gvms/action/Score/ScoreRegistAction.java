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
		
		String subId = request.getParameter("subId");
					   request.setAttribute("subId", subId);
		
		String stuId = request.getParameter("stuId");
					   request.setAttribute("stuId", stuId);
					   
	    String scoreDate = request.getParameter("scoreDate");
	    				request.setAttribute("scoreDate", scoreDate);
	    				
	   String acqScore = request.getParameter("acqScore");
	   					  request.setAttribute("AcqScore", acqScore);
	    				
	   					
	    				//Score_ACQ = 인트형인데...
	    				
	    System.out.println("sub_id : " + subId + " stu_id : " + stuId + " score_date : " + scoreDate 
	    				+  " score_acq : " + acqScore);
	    
	    				
	    ScoreVO scoVo = new ScoreVO();
	    scoVo.setSubId(subId);
	    scoVo.setStuId(stuId);
	    scoVo.setScoreDate(scoreDate);
	   	scoVo.setAcqScore(acqScore);
	    ScoreDao scoDao = ScoreDao.getInstance();
	    scoDao.insertScore(scoVo);
	    
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	    
	}

}
