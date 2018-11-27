package com.gvms.action.Mis;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String[] scoreId = request.getParameterValues("scoreId");
		request.setAttribute("scoreId", scoreId);
/*		String[] scoreDate = request.getParameterValues("scoreDate");
		request.setAttribute("scoreDate", scoreDate);*/
		
		String scoreIdIndivi ="";
		String scoreDateIndivi ="";
		
		MisDAO mDao = MisDAO.getInstance();
		MisVO mVo = new MisVO();
		
		for(int i=0; i<scoreId.length; i++) {
			
			scoreIdIndivi = scoreId[i];
			
			mVo.setScoreId(scoreIdIndivi);
			
			scoreDateIndivi = request.getParameter("scoreDate_"+scoreIdIndivi);
			mVo.setScoreDate(scoreDateIndivi);
			
			System.out.println("scoreId : " + mVo.getScoreId() + "       scoreDate : " + mVo.getScoreDate());
			
			mDao.modifyMis(mVo);
		}
		
/*		for(int i=0; i<scoreDate.length; i++) {
			
			scoreDateIndivi = scoreDate[i];
			
			mVo.setScoreDate(scoreDateIndivi);
			
		}*/
		
		
		new MisModifyFormAction().execute(request, response);
		
	}

}
