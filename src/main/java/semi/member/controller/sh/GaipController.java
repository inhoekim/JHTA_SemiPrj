package semi.member.controller.sh;



import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.gaip.util.sh.Utility;
import semi.member.Vo.je.HloginVoje;
import semi.member.dao.je.HloginDaoje;




@WebServlet("/Gaipsh")
public class GaipController extends HttpServlet{
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/home/Gaipsh.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String hlogin_id=req.getParameter("hlogin_id");
		String pwd = Utility.encoding(req.getParameter("pwd"));
		String name=req.getParameter("name");
		String jnum=req.getParameter("jnum");
		int age=Integer.parseInt(req.getParameter("age"));
		String area=req.getParameter("area");
		
		
		HloginVoje vo=new HloginVoje(hlogin_id, pwd, name, jnum, age, area, null,1);
		
		HloginDaoje dao=new HloginDaoje();
		int n=dao.insertsh(vo);
		
	
		if(n>0) {
			req.setAttribute("result","success");
		}else {
			req.setAttribute("result","fail");
		}
		
		resp.sendRedirect(req.getContextPath() + "/home");
	}
}

