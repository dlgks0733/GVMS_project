package com.gvms.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.SubjectDao;
import com.gvms.vo.SubjectVO;

public class SubModifyFormAction implements Action{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/subject/modify.jsp";
		
		String subId = request.getParameter("subId");
		request.setAttribute("subId", subId);

		
		SubjectDao sdao = SubjectDao.getInstance();
		ArrayList<SubjectVO> sublist = sdao.selectsubList(subId);
		request.setAttribute("sublist", sublist);


		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}