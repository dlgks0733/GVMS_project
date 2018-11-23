package com.gvms.action.Score;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "score?command=scoreListForm";
		
		String[] essCheck = request.getParameterValues("essCheck");
		request.setAttribute("essCheck", essCheck);
		String essCheckIndivi = "";

		String[] optCheck = request.getParameterValues("optCheck");
		request.setAttribute("optCheck", optCheck);
		String optCheckIndivi = "";

		if(essCheck != null) {
		
		for(int i = 0; i< essCheck.length; i++) {
			essCheckIndivi = essCheck[i];
			String essScoreId = request.getParameter(essCheckIndivi+"essScoreId");
								request.setAttribute("essScoreId", essScoreId);
			
			System.out.println("essCheckIndivi : "+ essCheckIndivi);
			
			ScoreVO scoVo = new ScoreVO();
			scoVo.setScoreId(essScoreId);
			
			ScoreDao scoDao = ScoreDao.getInstance();
			scoDao.deleteScore(scoVo);
			
		}
		}
		
		if(optCheck != null) {
			
			for(int i = 0; i< optCheck.length; i++) {
				optCheckIndivi = optCheck[i];
				String optScoreId = request.getParameter(optCheckIndivi+"optScoreId");
									request.setAttribute("optScoreId", optScoreId);
				
				System.out.println("optCheckIndivi : "+optCheck[i]);
				
				ScoreVO scoVo = new ScoreVO();
				scoVo.setScoreId(optScoreId);
				
				ScoreDao scoDao = ScoreDao.getInstance();
				scoDao.deleteScore(scoVo);
				
			}
			}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
		
	}

}
