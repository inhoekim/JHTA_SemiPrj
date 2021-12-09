package semi.main.controller.kih;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.JdbcUtil;

@WebServlet("/")
public class MainController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "");
		req.setAttribute("main", "");
		req.setAttribute("footer", "");
		JdbcUtil.getCon();
		req.getRequestDispatcher("/main/layout.jsp").forward(req, resp);
	}
}
