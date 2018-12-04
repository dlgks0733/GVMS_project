package com.gvms.action;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gvms.dao.AdminDao;
import com.gvms.vo.AdminVO;

public class LoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String url = "main?command=main";
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("LoginUser") != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
		
			} else {
				AdminVO aVo = new AdminVO();
				AdminDao aDao = AdminDao.getInstance();
				
				aVo.setAdminId(request.getParameter("adminId"));
				aVo.setAdminPw(request.getParameter("adminPw"));
				
				System.out.println(aDao.loginCheck(aVo));
				
				switch (aDao.loginCheck(aVo)) {
					case 1: 
					{
						AdminVO sessionVo = aDao.getAdminInfo(aVo);
						session.setAttribute("LoginUser", sessionVo);
						System.out.println(sessionVo);
						break;
					}
					case 0: {
						request.setAttribute("message", "비밀번호를 확인하세요"); 
						url = "main?command=loginForm";
						break;
					}
					case -1: {					
						request.setAttribute("message", "존재하지 않는 회원입니다");
						url = "main?command=loginForm";
						break;
					}
					default : request.setAttribute("message", "오류가 발생했습니다");
				}					
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			}
			
		}
	}
