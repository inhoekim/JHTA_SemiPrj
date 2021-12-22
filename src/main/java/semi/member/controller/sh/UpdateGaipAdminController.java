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




@WebServlet("/Admin/update")
public class UpdateGaipAdminController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hlogin_id=req.getParameter("hlogin_id");
		HloginDaoje dao=new HloginDaoje();
		HloginVoje vo=dao.selecthloginid(hlogin_id);
		if(vo==null) {
			req.setAttribute("result","fail");
			req.getRequestDispatcher("/sh/result.jsp").forward(req, resp);
		}else {
			req.setAttribute("vo", vo);
			req.setAttribute("header", "/Admin/header.jsp");
			req.setAttribute("main", "/Admin/AdminUpdate.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/Admin/layout.jsp").forward(req, resp);
			//req.getRequestDispatcher("/sh/AdminUpdate.jsp").forward(req, resp);
		}	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String hlogin_id=req.getParameter("hlogin_id");
		String pwd=Utility.encoding(req.getParameter("pwd"));
		String name=req.getParameter("name");
		String jnum=req.getParameter("jnum");
		int age=Integer.parseInt(req.getParameter("age"));
		String area=req.getParameter("area");
		int num=Integer.parseInt(req.getParameter("num"));
		HloginVoje vo=new HloginVoje(hlogin_id, pwd, name, jnum, age, area, null, num);
		HloginDaoje dao=new HloginDaoje();
		int n=dao.adminupdate(vo);
		if(n>0) {
			req.setAttribute("result","success");
		}else {
			req.setAttribute("result","fail");
		}
		req.getRequestDispatcher("/home/result.jsp").forward(req, resp);
	}
}