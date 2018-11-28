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

		String[] essSubId = request.getParameterValues("essSubId");
		String[] optSubId = request.getParameterValues("optSubId");
		
		if(essSubId != null) {
		for (int idx = 0; essSubId.length > idx; idx++) {
			request.setAttribute("essSubId", essSubId[idx]);

			System.out.println("subId : " + essSubId[idx]);

			SubjectVO subVO = new SubjectVO();

			subVO.setSubId(essSubId[idx]);

			SubjectDao sdao = SubjectDao.getInstance();
			sdao.deletesubject(subVO);
		}
		}
		if(optSubId != null) {
		for (int idx = 0; optSubId.length > idx; idx++) {
			request.setAttribute("optSubId", optSubId[idx]);

			System.out.println("optSubId : " + optSubId[idx]);

			SubjectVO subVO = new SubjectVO();

			subVO.setSubId(optSubId[idx]);

			SubjectDao sdao = SubjectDao.getInstance();
			sdao.deletesubject(subVO);
		}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
