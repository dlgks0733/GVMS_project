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
		
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String scoreSum = request.getParameter("scoreSum");
		
		request.setAttribute("stuId", stuId);
		request.setAttribute("stuName", stuName);
		request.setAttribute("scoreSum", scoreSum);
		
		System.out.println("stuId : " + stuId);
		System.out.println("stuName : " + stuName);
		System.out.println("scoreSum : " + scoreSum);
		
		MisVO mVo = new MisVO();
		
		mVo.setStuId(stuId);
		mVo.setStuId(stuName);
		mVo.setStuId(scoreSum);
		
		List<MisVO> misListRead = mDao.selectMisScoreDate(stuName);
		request.setAttribute("misListRead", misListRead);
		
		System.out.println(misListRead);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
