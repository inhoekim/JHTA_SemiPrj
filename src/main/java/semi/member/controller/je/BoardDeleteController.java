package semi.member.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.dao.je.BoardDaoje;

@WebServlet("/service/board/delete")
public class BoardDeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int ref = Integer.parseInt(req.getParameter("ref"));
		BoardDaoje dao = new BoardDaoje();
		int n = dao.delete(ref);
		if (n > 0) {
			req.setAttribute("result", "success");
		} else {
			req.setAttribute("result", "false");
		}
		req.getRequestDispatcher("/je/Service/BoardDeleteResult.jsp").forward(req, resp);
	}
}
