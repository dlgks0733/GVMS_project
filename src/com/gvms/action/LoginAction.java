package com.gvms.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gvms.dao.LoginDao;
import com.gvms.vo.AdminVO;

public class LoginAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/admin/login/login.jsp";
		
		String adminid = request.getParameter("adminid");
		String adminpw = request.getParameter("adminpw");
		
		LoginDao mDao = LoginDao.getInstance();
		int result = mDao.adminCheck(adminid, adminpw);
		System.out.println(adminid + "********************" + adminpw);
		if (result == 1)
		{
			AdminVO mVo = mDao.getMember(adminid);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mVo);
			request.setAttribute("msg", "로그인에 성공했습니다");
			url = "/admin/index.jsp";//////////////////////임시로 처리해놓음
		}
		else if (result == 0)
		{
			request.setAttribute("msg", "비밀번호가 맞지 않습니다.");
		}
		else if (result == -1)
		{
			request.setAttribute("msg", "존재하지 않은 회원입니다.");

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
