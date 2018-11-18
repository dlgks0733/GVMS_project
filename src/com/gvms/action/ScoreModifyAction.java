package com.gvms.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.dao.ScoreDao;
import com.gvms.vo.ScoreVO;

public class ScoreModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "score?command=readForm";

		String scoreId = request.getParameter("scoreId");
		request.setAttribute("scoreId", scoreId);
		
		String subId = request.getParameter("EssSubId");
		request.setAttribute("subId", subId);
		request.getParameter("OptSubId");
		request.setAttribute("subId", subId);

		String acqScore = request.getParameter("acqScore");
		request.setAttribute("acqScore", acqScore);
		
		ScoreVO scoVo = new ScoreVO();
		ScoreDao scoDao = ScoreDao.getInstance();
		scoDao.updateScore(scoVo);

	}

}
