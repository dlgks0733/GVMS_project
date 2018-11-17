package com.gvms.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisReadFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/mis/misRead.jsp";
		
		MisDAO mDao = MisDAO.getInstance();
		
		String stuName = request.getParameter("stuName");
		request.setAttribute("stuName", stuName);
		
		System.out.println("stuName : " + stuName);
		
		MisVO mVo = new MisVO();
		
		mVo.setStuId(stuName);
		
		List<MisVO> misListRead = mDao.selectMisScoreDate(stuName);
		request.setAttribute("misListRead", misListRead);
		
		System.out.println(misListRead);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
