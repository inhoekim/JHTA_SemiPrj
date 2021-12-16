package semi.board.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.je.BoardVoje;
import semi.member.dao.je.BoardDaoje;
@WebServlet("/service/admin/detail")
public class BoardAdminDtailController extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	int service_id = Integer.parseInt(req.getParameter("service_id"));
    	BoardDaoje dao = new BoardDaoje();
		BoardVoje vo = dao.Adminselect(service_id);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/je/AdminService/Admindetail.jsp").forward(req, resp);
    }
}
