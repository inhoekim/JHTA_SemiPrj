package semi.board.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.je.BoardVoje;
import semi.member.dao.je.BoardDaoje;
@WebServlet("/service/admin/comment")
public class BoardAdminCommentController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/je/Service/Board.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String writer=req.getParameter("writer");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		int service_id=0;
		int ref=0;
		int lev=0;
		int step=0;
		String snum=req.getParameter("service_id");
		if(snum!=null && !snum.equals("")) {//답글인 경우			
			service_id=Integer.parseInt(snum);
			ref=Integer.parseInt(req.getParameter("ref"));
			lev=Integer.parseInt(req.getParameter("lev"));
			step=Integer.parseInt(req.getParameter("step"));
		}
		BoardDaoje dao=new BoardDaoje();
		BoardVoje vo=new BoardVoje(service_id, writer, title, content, pwd, ref, lev, step, null, null);
		int n=dao.insert(vo);
		if(n>0) {
			req.setAttribute("result", "success");
		}else {
			req.setAttribute("result", "fail");
		}
		req.getRequestDispatcher("/je/AdminService/AdminBoardResult.jsp").forward(req, resp);
		
	}

}
