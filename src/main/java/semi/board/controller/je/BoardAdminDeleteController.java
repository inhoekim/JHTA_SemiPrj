package semi.board.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.dao.je.BoardDaoje;
@WebServlet("/admin/service/delete")
public class BoardAdminDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int ref = Integer.parseInt(req.getParameter("ref"));
		int lev = Integer.parseInt(req.getParameter("lev"));
		int step = Integer.parseInt(req.getParameter("step"));
		int service_id = Integer.parseInt(req.getParameter("service_id"));
		BoardDaoje dao = new BoardDaoje();
		int n = dao.delete(ref,lev,step,service_id);
		if (n > 0) {
			req.setAttribute("result", "success");
			req.setAttribute("header", "/Admin/header.jsp");
			req.setAttribute("main", "/Admin/AdminResult.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/Admin/layout.jsp").forward(req, resp);
		} else {
			req.setAttribute("result", "false");
			req.setAttribute("header", "/Admin/header.jsp");
			req.setAttribute("main", "/Admin/AdminResult.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/Admin/layout.jsp").forward(req, resp);
		}
	}
}

