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

		String[] subIds = request.getParameterValues("subId");
		
		for (int idx = 0; subIds.length > idx; idx++) {
			request.setAttribute("subId", subIds[idx]);

			System.out.println("subId : " + subIds[idx]);

			SubjectVO subVO = new SubjectVO();

			subVO.setSubId(subIds[idx]);

			SubjectDao sdao = SubjectDao.getInstance();
			sdao.deletesubject(subVO);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
