package semi.home.controller.ihk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class MainController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("searchBar", "/home/searchBar.jsp");
		req.setAttribute("main", "/home/main.html");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/home/layout.jsp").forward(req, resp);
	}
}
