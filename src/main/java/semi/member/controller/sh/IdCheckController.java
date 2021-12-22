package semi.member.controller.sh;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.dao.je.HloginDaoje;





@WebServlet("/idcheck")
public class IdCheckController extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			resp.sendRedirect(req.getContextPath() + "/home/Gaipsh.jsp");
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			
			String hlogin_id= req.getParameter("hlogin_id");
			
			
			
	
			HloginDaoje dao=new HloginDaoje();
			int n=dao.idChk(hlogin_id);
			System.out.println(n);
			resp.setContentType("text/plain;charset=utf-8");
			PrintWriter pw=resp.getWriter();
			if(n == 1) {
				pw.print("1");
			}else {
				pw.print("0");
			}
//			req.getRequestDispatcher("/sh/result.jsp").forward(req, resp);
		}
}
