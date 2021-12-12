package semi.member.controller.je;
 
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.dao.je.BoardDaoje;
@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/je/Service/BoardUpdate.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int service_id=Integer.parseInt(req.getParameter("service_id"));
		String writer=req.getParameter("writer");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		int ref=Integer.parseInt(req.getParameter("ref"));
		int lev=Integer.parseInt(req.getParameter("lev")); 
		int step=Integer.parseInt(req.getParameter("step"));
		BoardDaoje dao=new BoardDaoje();
		int n= dao.update(writer, title, content, pwd, service_id);
		if(n>0) {
			req.setAttribute("result", "success");
		}else {
			req.setAttribute("result", "false");
		}
		req.getRequestDispatcher("/je/Service/BoardResult.jsp").forward(req, resp);
	}

}
