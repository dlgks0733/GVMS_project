package com.gvms.action;

/**
 * 
 * @author OSJ
 *
 */

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisRegistAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String url = "mis?command=mis_regist_form";
		
		//요청 된 jsp에서 Parameter 가져오기
		//체크박스를 위한 stuId 배열로 생성
		String[] stuId = request.getParameterValues("stuId");
		String scoreDate = request.getParameter("scoreDate");
		
		//학번 배열 체크하는 stuIdIndivi 생성
		String stuIdIndivi ="";
		//MisVo 객체 생성
	
		MisDAO mDao = MisDAO.getInstance();
		
		for(int i=0; i<stuId.length; i++) {
			
			/*System.out.println("stuId : " + stuId[i]);*/
			stuIdIndivi = stuId[i];
			
			//객체 셋팅
			MisVO mVo = new MisVO();
			mVo.setStuId(stuIdIndivi);
			mVo.setScoreDate(scoreDate);
			mDao.insertMis(mVo);
			
			
		}
		
		//Parameter 출력
		System.out.println("scoreDate : " + scoreDate);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	}

}
