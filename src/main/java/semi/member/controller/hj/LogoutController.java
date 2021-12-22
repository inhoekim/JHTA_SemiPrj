package semi.member.controller.hj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/logout")
public class LogoutController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String hlogin_id=req.getParameter("hlogin_id");
		
		Cookie cook1=new Cookie("hlogin_id",hlogin_id);
		cook1.setMaxAge(0);
		cook1.setPath("/");
		resp.addCookie(cook1);

		HttpSession session=req.getSession();
		session.invalidate();
		
		resp.sendRedirect(req.getContextPath() + "/home");
	}
}
