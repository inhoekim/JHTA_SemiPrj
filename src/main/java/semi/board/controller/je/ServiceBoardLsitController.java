package semi.board.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/servicelist/page")
public class ServiceBoardLsitController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("main", "/ServiceList/ServiceList.jsp");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/ServiceList/ServiceListlayout.jsp").forward(req, resp);
	}

}
