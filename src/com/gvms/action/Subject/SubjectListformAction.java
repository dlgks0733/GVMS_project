package com.gvms.action.Subject;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.SubjectDao;
import com.gvms.vo.SubjectVO;

public class SubjectListformAction implements Action{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/subject/list.jsp";
		
		SubjectDao sdao = SubjectDao.getInstance();
		
		ArrayList<SubjectVO> esslist = sdao.selectessList();
		request.setAttribute("esslist", esslist);
		
		ArrayList<SubjectVO> optlist = sdao.selectoptList();
		request.setAttribute("optlist", optlist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
		
	}

		
	}


