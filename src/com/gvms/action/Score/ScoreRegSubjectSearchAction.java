package com.gvms.action.Score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.ScoreDao;
import com.gvms.dao.SubjectDao;
import com.gvms.vo.ScoreVO;
import com.gvms.vo.SubjectVO;

public class ScoreRegSubjectSearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listEmp = 0;
		
			String url = "/score/registSearch.jsp";
			String subName = request.getParameter("subName");
							 request.setAttribute("subName", subName);
							 System.out.println(subName);
							 
		String p_index = request.getParameter("p_index");
								request.setAttribute("p_index", p_index);
							 
								System.out.println("======> p_index:  "+ p_index);
							 	
			
			ScoreDao scoDao = ScoreDao.getInstance();
			ArrayList<ScoreVO> list = scoDao.SearchSubject(subName.toUpperCase().replaceAll(" ", ""));
			request.setAttribute("list", list);
			
			if(list.isEmpty() == true) {
				listEmp = 1;
			}
			
			request.setAttribute("listEmp", listEmp);
			System.out.println("listEmp : " + listEmp);
			
			
			ArrayList<ScoreVO> allSubList = scoDao.selectAllSubList();
			request.setAttribute("allSubList", allSubList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
	}

}
