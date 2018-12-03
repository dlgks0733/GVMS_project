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

public class MisModifySelectFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/mis/misModify.jsp";
		
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		
		request.setAttribute("fromDate", fromDate);
		request.setAttribute("toDate", toDate);
		
		System.out.println("fromDate : "+fromDate);
		System.out.println("toDate : "+toDate);
		
		MisVO mVo = new MisVO();
		
		mVo.setFromDate(fromDate);
		mVo.setToDate(toDate);

		MisDAO mDao = MisDAO.getInstance();
		
		List<MisVO> misModifyList = mDao.selectMisModifyGetScoreDate(fromDate, toDate);
		
		request.setAttribute("misModifyList", misModifyList);
		
		System.out.println(misModifyList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
