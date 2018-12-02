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

public class SubjectModifyFormAction implements Action{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/subject/modify.jsp";
		// 값 설정
		int major_num = 0;
		int essmiddle_num = 0;
		int optmiddle_num = 0;
		
		String subId = request.getParameter("subId");
		request.setAttribute("subId", subId);
		
		System.out.println("subId : " + subId);

		
		SubjectDao sdao = SubjectDao.getInstance();
		ArrayList<SubjectVO> sublist = sdao.selectsubList(subId);
		request.setAttribute("sublist", sublist);
		//Radio button 값 불러오기 
		for (SubjectVO subject : sublist) {
			if ("필수".equals(subject.getMajor())){
				System.out.println(subject.getMajor() + major_num);
				major_num = 1;
			}
			
		}
		request.setAttribute("major_num", major_num);
		
		//Select Box 값 불러오기
		for(SubjectVO subject : sublist) {
			if("외국어영역".equals(subject.getMiddle())) {
				System.out.println(subject.getMiddle() + essmiddle_num);
				essmiddle_num = 1;
			}else if("학생활동영역".equals(subject.getMiddle())){
				System.out.println(subject.getMiddle() + essmiddle_num);
				essmiddle_num = 2;
			}
		}
		request.setAttribute("essmiddle_num", essmiddle_num);
		
		for(SubjectVO subject : sublist) {

				if("정보화영역".equals(subject.getMiddle())) {
				System.out.println(subject.getMiddle() + optmiddle_num);
				optmiddle_num = 3;
				}else if("금융/회계영역".equals(subject.getMiddle())) {
				System.out.println(subject.getMiddle() + optmiddle_num);
				optmiddle_num = 4;
				}else if("공모전영역".equals(subject.getMiddle())) {
				System.out.println(subject.getMiddle() + optmiddle_num);
				optmiddle_num = 5;
				}else if("기타".equals(subject.getMiddle())) {
				System.out.println(subject.getMiddle() + optmiddle_num);
				optmiddle_num = 6;
			}
		}
		
		request.setAttribute("optmiddle_num", optmiddle_num);

		
		System.out.println(sublist);

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}