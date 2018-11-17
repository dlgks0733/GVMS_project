package com.gvms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreRegistAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "score?command=scoreListForm";
		
		String sub_id = request.getParameter("subID");
					   request.setAttribute("sub_id", sub_id);
		
		String stu_id = request.getParameter("stuID");
					   request.setAttribute("stu_id", stu_id);
					   
	    String score_date = request.getParameter("scoreDate");
	    				request.setAttribute("score_date", score_date);
	    				
	   String score_acq = request.getParameter("acqScore");
	   					  request.setAttribute("score_acq", score_acq);
	    				
	   					
	    				//Score_ACQ = 인트형인데...
	    				
	    System.out.println("sub_id : " + sub_id + " stu_id : " + stu_id + " score_date : " + score_date 
	    				+  " score_acq : " + score_acq);
	    
	    				
	    ScoreVO scoVo = new ScoreVO();
	    scoVo.setSub_id(sub_id);
	    scoVo.setStu_id(stu_id);
	    scoVo.setScore_date(score_date);
	   	scoVo.setScore_acq(score_acq);
	    ScoreDao scoDao = ScoreDao.getInstance();
	    scoDao.insertScore(scoVo);
	    
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	    
	}

}
