package com.gvms.action.Student;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gvms.action.Action;
import com.gvms.dao.StudentDao;

public class StuCheckAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String url = "student/check.jsp";
      String stuId = null;

      // 한글로 입력 받았을 때 받을 수 있도록 하기 위함
      if (request.getParameter("popup").equals("yes")) {

         stuId = request.getParameter("stuId");

      } else {
         stuId = new String(request.getParameter("stuId").getBytes("8859_1"), "UTF-8");

      }

      System.out.println("레그넘 = " + stuId);
      StudentDao sDao = StudentDao.getInstance();

/*      int result = sDao.confirmStuId(stuId);

      System.out.println(result);
      request.setAttribute("stuId", stuId);
      request.setAttribute("result", result);
      */

       

      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
   }
}
