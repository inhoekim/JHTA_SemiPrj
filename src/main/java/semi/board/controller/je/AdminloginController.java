package semi.board.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.dao.je.HloginDaoje;
@WebServlet("/admin/login")
public class AdminloginController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String admin_id=req.getParameter("admin_id");
		String pwd=req.getParameter("pwd");
		HloginDaoje dao=new HloginDaoje();
		boolean a=dao.Adminlogin(admin_id, pwd);
		if(a) {
			HttpSession session=req.getSession();
			session.setAttribute("admin_id", admin_id);
			req.getRequestDispatcher("/admin").forward(req, resp);
		}else {
			req.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않습니다.");
			req.getRequestDispatcher("/admin?apage=/Admin/Adminlogin.jsp").forward(req, resp);
			
		}
	}

}
