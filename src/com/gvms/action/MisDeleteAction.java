package com.gvms.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*String url = "mis?command=mis_read_form";*/
		
//		String stuName = request.getParameter("stuName");
//		String scoreSum = request.getParameter("scoreSum");
		String stuId = request.getParameter("stuId");
		String[] scoreDate = request.getParameterValues("scoreDate");
		
		//날짜 배열 체크하는 scoreDateIndivi 생성
		String scoreDateIndivi ="";

		MisDAO mDao = MisDAO.getInstance();
		
			for(int i=0; i<scoreDate.length; i++) {	
			
			System.out.println("scoreDate : " + scoreDate[i]);
			scoreDateIndivi = scoreDate[i];
			
			//객체 셋팅
			MisVO mVo = new MisVO();
			mVo.setScoreDate(scoreDateIndivi);
			mVo.setStuId(stuId);
			/*mVo.setStuName(stuName);
			mVo.setStuName(scoreSum);
			*/
			
			mDao.deleteMis(stuId, scoreDate[i]);
		}
			
			new MisListFormAction().execute(request, response);
		
/*		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);*/
	}

}
