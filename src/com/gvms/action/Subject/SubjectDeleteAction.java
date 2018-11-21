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

public class SubjectDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/subject?command=subList";
		
		String subId = request.getParameter("subId");
		request.setAttribute("subId", subId);
		
		System.out.println("subId : " + subId);
		SubjectDao sdao = SubjectDao.getInstance();
		
		SubjectVO subVO = new SubjectVO();
		subVO.setSubId(subId);
		
		ArrayList<SubjectVO> list = sdao.selectsubList(subId);
		request.setAttribute("list", list);
		
		sdao.deletesubject(subId);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);	
		
	}

}
