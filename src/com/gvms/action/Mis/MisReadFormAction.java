package com.gvms.action.Mis;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisReadFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/mis/misRead.jsp";
		
		MisDAO mDao = MisDAO.getInstance();
		
		String stuId = request.getParameter("stuId");
		
		request.setAttribute("stuId", stuId);
		
		System.out.println("stuId : " + stuId);
		System.out.println("출력");
		
		MisVO mVo = new MisVO();
		
		mVo.setStuId(stuId);
		
		List<MisVO> misListReadScoreSum = mDao.selectMisScoreSum(stuId);
		List<MisVO> misListRead = mDao.selectMisScoreDate(stuId);
		
		request.setAttribute("misListReadScoreSum", misListReadScoreSum);
		request.setAttribute("misListRead", misListRead);
		
		System.out.println(misListReadScoreSum);
		System.out.println(misListRead);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	} 
	}
