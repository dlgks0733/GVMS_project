package com.gvms.action.Subject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.SubjectDao;
import com.gvms.vo.SubjectVO;

public class SubjectModifyAction implements Action{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/subject?command=subList";
			

		String subId = request.getParameter("subId");
		request.setAttribute("subId", subId);
		String major = request.getParameter("major");
		request.setAttribute("major", major);
		String middle = request.getParameter("middle");
		request.setAttribute("middle", middle);
		String subName = request.getParameter("subName");
		request.setAttribute("subName", subName);
		String subScore = request.getParameter("subScore");
		request.setAttribute("subScore", subScore);
		
		System.out.println("subId :" + subId );
		System.out.println("major :" + major );
		System.out.println("middle :" + middle );
		System.out.println("subName :" + subName );
		System.out.println("subScore :" + subScore );

        
		SubjectVO subVO = new SubjectVO();
		
		subVO.setSubId(subId);
		subVO.setMajor(major);
		subVO.setMiddle(middle);
		subVO.setSubName(subName);
		subVO.setSubScore(subScore);
		
		SubjectDao sdao = SubjectDao.getInstance();
		sdao.updatesubject(subVO);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
}


}