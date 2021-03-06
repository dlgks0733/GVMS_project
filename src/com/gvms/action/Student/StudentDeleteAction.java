package com.gvms.action.Student;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.StudentDao;
import com.gvms.vo.StudentVO;

public class StudentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("진입");
		
		String[] stuCheck = request.getParameterValues("stuCheck");
		
		for (String string : stuCheck) {
			System.out.println("아아디 : " + string);
		}
		
		String stuIdIndivi ="";

		StudentDao stuDao = StudentDao.getInstance();
		
		
			for(int i=0; i<stuCheck.length; i++) {	
			
				
			System.out.println("stuCheck : " + stuCheck[i]);
			stuIdIndivi = stuCheck[i];
			
			
			//객체 셋팅
			StudentVO stuVo = new StudentVO();
			stuVo.setStuId(stuIdIndivi);
		
			
			stuDao.deleteStudent(stuIdIndivi);
		}
			
			
			new StudentListFormAction().execute(request, response);
		

	}

}

