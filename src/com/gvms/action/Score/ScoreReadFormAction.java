package com.gvms.action.Score;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.ScoreDao;
import com.gvms.vo.MisVO;
import com.gvms.vo.ScoreVO;
import com.gvms.vo.SubjectVO;

public class ScoreReadFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/score/read.jsp";
		
		String stuId = request.getParameter("stuId");
						request.setAttribute("stuId", stuId);
		String stuName = request.getParameter("stuName");
						request.setAttribute("stuName", stuName);
		
		/*String stuName = request.getParameter("stuName");
						 request.setAttribute("stuName", stuName);*/
						
		System.out.println(stuId + " " + stuName);
		
	    ScoreDao scoDao = ScoreDao.getInstance();
		ArrayList<ScoreVO> optList = scoDao.ScoreOptList(stuId);
		request.setAttribute("optList", optList);
		
		ArrayList<ScoreVO> essList = scoDao.ScoreEssList(stuId);
		request.setAttribute("essList", essList);
		
		
		ArrayList<MisVO> misSum = scoDao.readFormMisSum(stuId);
		request.setAttribute("misSum", misSum);
	
		
		
		/*ArrayList<SubjectVO> misList = scoDao.readFormMisSum(stuId);
		
		ArrayList<SubjectVO> mis = new ArrayList<SubjectVO>();

		if(misList != null) {
			SubjectVO subVo = new SubjectVO();
			int misSize = misList.size();
			int misTotalScore = misSize*3;
			String misSum = String.valueOf(misTotalScore);
			System.out.println("misTotalScore: "+misTotalScore);
			
			subVo.setMiddle(misList.get(0).getMiddle());
			subVo.setSubName(misList.get(0).getSubName());
			subVo.setSubScore(misSum); 
			
			System.out.println(subVo);
		} 
		
		
		request.setAttribute("mis", mis); */

		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
