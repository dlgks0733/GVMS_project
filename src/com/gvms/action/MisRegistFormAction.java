package com.gvms.action;

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
import com.gvms.dao.MisDAO;
import com.gvms.vo.MisVO;

public class MisRegistFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/mis/misWrite.jsp";
		
		MisDAO mDao = MisDAO.getInstance();
		
		List<MisVO> misListWrite = mDao.selectMisWrite();
		
		request.setAttribute("misListWrite", misListWrite);
		
		System.out.println(misListWrite);
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		
	}

}
