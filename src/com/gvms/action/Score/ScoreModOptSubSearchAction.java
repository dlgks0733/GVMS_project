package com.gvms.action.Score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreModOptSubSearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		 String url = "/score/modifyOptSubSearch.jsp";
			String subName = request.getParameter("subName");
							 request.setAttribute("subName", subName);
							 System.out.println(subName);
			
			String index = request.getParameter("index");
						   request.setAttribute("index", index);
			
			System.out.println("index : " + index);
							
			ScoreDao scoDao = ScoreDao.getInstance();
			ArrayList<ScoreVO> list = scoDao.SearchOptSubject(subName.toUpperCase().replaceAll(" ",	""));
			request.setAttribute("list", list);
			System.out.println(list);
			ArrayList<ScoreVO> allOptList = scoDao.allOptSubject();
			request.setAttribute("allOptList", allOptList);
			
			if(list.equals("")) {
				String listChk = "0";
				request.setAttribute("listChk", listChk);
				System.out.println(listChk);
			}else {
				String listChk = "1";
				request.setAttribute("listChk", listChk);
				System.out.println(listChk);
			}
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
	}

}
