package com.gvms.action.Subject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.SubjectDao;
import com.gvms.vo.SubjectVO;

public class SubjectRegisterAction implements Action {

	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/subject?command=subList"; // 등록후 목록 최신화 시켜주기위해 다시 메인으로 보냄
		
		String subId = request.getParameter("subId");
		String major = request.getParameter("major");
		String middle = request.getParameter("middle");
		String subName = request.getParameter("subName");
		String subScore = request.getParameter("subScore");
		
		System.out.println("subId :" + subId );
		System.out.println("major :" + major );
		System.out.println("middle :" + middle );
		System.out.println("subName :" + subName );
		System.out.println("subScore :" + subScore );
	 
		SubjectVO sVO = new SubjectVO();
		
		sVO.setMajor(subId);
		sVO.setMajor(major);
		sVO.setMiddle(middle);
		sVO.setSubName(subName);
		sVO.setSubScore(subScore);
		
		SubjectDao sdao = SubjectDao.getInstance();
		sdao.insertsubject(sVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

		
	}

}
