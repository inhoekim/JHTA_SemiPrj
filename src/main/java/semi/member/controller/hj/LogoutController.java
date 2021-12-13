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
		String pwd=req.getParameter("pwd");

		HttpSession session=req.getSession();
		session.invalidate();
		
		Cookie cook1=new Cookie("hlogin_id",hlogin_id);
		cook1.setMaxAge(0);
		cook1.setPath("/");
		Cookie cook2=new Cookie("pwd",pwd);
		cook2.setMaxAge(0);
		cook2.setPath("/");
		resp.addCookie(cook1);
		resp.addCookie(cook2);
		
		resp.sendRedirect("/semiPrj/hj/main_test.jsp");
	}
}
