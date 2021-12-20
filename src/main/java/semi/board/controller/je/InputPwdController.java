package semi.board.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/service/inputpwd")
public class InputPwdController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("main", "/Service/InputPwd.jsp");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/Service/layout.jsp").forward(req, resp);
	}

}