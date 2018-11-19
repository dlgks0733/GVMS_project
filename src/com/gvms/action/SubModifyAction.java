package com.gvms.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.SubjectDao;
import com.gvms.vo.SubjectVO;

public class SubModifyAction implements Action{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/subject?command=sub_list";
			
		String subId = request.getParameter("subId");
		request.setAttribute("subId", subId);
		String major = request.getParameter("major");
		request.setAttribute("major", major);

        
		SubjectVO sVO = new SubjectVO();
		
		SubjectDao sdao = SubjectDao.getInstance();
		sdao.updatesubject(sVO);


			
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
}


}