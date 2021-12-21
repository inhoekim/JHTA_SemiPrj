package semi.room.controller.hj;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.room.dao.hj.RoomDao;
import semi.room.vo.ihk.RoomVo;
@WebServlet("/listroom")
public class RoomListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RoomDao dao=RoomDao.getInstance();
		ArrayList<RoomVo> list=dao.roomselectAll();
		req.setAttribute("list", list);
		req.setAttribute("header", "/Admin/header.jsp");
		req.setAttribute("main", "/Admin/Adminlistroom.jsp");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/Admin/layout.jsp").forward(req, resp);
	}
}
