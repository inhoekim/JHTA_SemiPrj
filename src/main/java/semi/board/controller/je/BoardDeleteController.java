package semi.board.controller.je;

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
		int service_id=Integer.parseInt(req.getParameter("service_id"));
		int lev=Integer.parseInt(req.getParameter("lev"));
		int step=Integer.parseInt(req.getParameter("step"));
		BoardDaoje dao = new BoardDaoje();
		int n = dao.delete(ref,service_id,lev,step);
		if (n > 0) {
			req.setAttribute("result", "success");
			req.setAttribute("header", "/home/header.jsp");
			req.setAttribute("main", "/Service/DeleteResult.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/Service/layout.jsp").forward(req, resp);
			
		} else {
			req.setAttribute("result", "false");
			req.setAttribute("header", "/home/header.jsp");
			req.setAttribute("main", "/Service/DeleteResult.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/Service/layout.jsp").forward(req, resp);
		}
	}
}
