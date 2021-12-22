package semi.member.controller.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.je.HloginVoje;
import semi.member.dao.je.HloginDaoje;



@WebServlet("/selecthloginid")
public class SelectGaipController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hlogin_id = req.getParameter("hlogin_id");
		
	
		HloginDaoje dao=new HloginDaoje();
		HloginVoje vo=dao.selecthloginid(hlogin_id);
		if(vo==null) {
			req.setAttribute("result","fail");
			req.getRequestDispatcher("/home/result.jsp").forward(req, resp);
		}else {
			req.setAttribute("vo", vo);
			req.setAttribute("header", "/home/header.jsp");
			req.setAttribute("main", "/home/updatesh.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/home/layout.jsp").forward(req, resp);
		}	
	}
}
