package com.gvms.action.Mis;

/**
 * 
 * @author OSJ
 *
 */

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisListFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/mis/misList.jsp";
		
		
		MisDAO mDao = MisDAO.getInstance();
		
		List<MisVO> misList = mDao.selectMis();
		
		request.setAttribute("misList", misList);
		
		System.out.println(misList);
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
