package com.gvms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;


public class MisReadAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "mis?command=mis_read_form";
		
		String stuName = request.getParameter("stuName");
		
		System.out.println("stuName : " + stuName);
		
		MisVO mVo = new MisVO();
		
		mVo.setStuId(stuName);
		
		MisDAO mDao = MisDAO.getInstance();
		
		mDao.selectMisScoreDate(stuName);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
