package com.gvms.action.Mis;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;


public class MisReadAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "mis?command=mis_read_form";
		
		
		String stuId = request.getParameter("stuId");
		
		
		MisVO mVo = new MisVO();
		
		
		mVo.setStuId(stuId);
		
		MisDAO mDao = MisDAO.getInstance();
		

		mDao.selectMisScoreDate(stuId);
		mDao.selectMisScoreSum(stuId);
		
		
		System.out.println("stuId : " + stuId);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
