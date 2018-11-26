package com.gvms.action.Score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.SubjectDao;
import com.gvms.vo.SubjectVO;

public class ScoreRegSubjectSearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String url = "/score/registSearch.jsp";
			String subName = request.getParameter("subName");
							 request.setAttribute("subName", subName);
							 System.out.println(subName);
							 
		String p_index = request.getParameter("p_index");
								request.setAttribute("p_index", p_index);
							 
								System.out.println("======> p_index:  "+ p_index);
							 	
			SubjectDao subDao = SubjectDao.getInstance();
			ArrayList<SubjectVO> list = subDao.SearchSubject(subName.toUpperCase().replaceAll(" ", ""));
			request.setAttribute("list", list);
			System.out.println(list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
	}

}
