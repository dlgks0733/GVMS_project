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
			
			//파라미터값을 가져온다
			String subId = request.getParameter("subId");
			String major = request.getParameter("major");
			String middle = request.getParameter("middle");
			String subName = request.getParameter("subName");
			String subScore = request.getParameter("subScore");
			
			System.out.println("subID :" + subId );
			System.out.println("major :" + major );
			System.out.println("middle :" + middle );
			System.out.println("subName :" + subName );
			System.out.println("subScore :" + subScore );
		
			//파라미터값을 VO에 세팅한다.
			SubjectVO sVO = new SubjectVO();

			sVO.setMajor(subId);
			sVO.setMajor(major);
			sVO.setMiddle(middle);
			sVO.setSubName(subName);
			sVO.setSubScore(subScore);
			
			SubjectDao sdao = SubjectDao.getInstance();
			sdao.updatesubject(sVO);
			
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
}


}