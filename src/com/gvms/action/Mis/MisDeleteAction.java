package com.gvms.action.Mis;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*String url = "mis?command=mis_read_form";*/
		
		String[] scoreId = request.getParameterValues("scoreId");
		
		String scoreIdIndivi ="";

		MisDAO mDao = MisDAO.getInstance();
		
			for(int i=0; i<scoreId.length; i++) {	
			
			System.out.println("scoreId : " + scoreId[i]);
			scoreIdIndivi = scoreId[i];
			
			//객체 셋팅
			MisVO mVo = new MisVO();
			mVo.setScoreId(scoreIdIndivi);
			
			
			mDao.deleteMis(mVo);
		}
			
			new MisListFormAction().execute(request, response);

	}
}
