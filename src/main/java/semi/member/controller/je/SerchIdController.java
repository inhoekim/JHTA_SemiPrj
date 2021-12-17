package semi.member.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/findid")
public class SerchIdController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("main", "/FindId/FindId.html");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/FindId/layoutje.jsp").forward(req, resp);
	}
}
