package semi.reserve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.room.dao.ihk.RoomDao;

@WebServlet("/reserve")
public class ReserveController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.setAttribute("header", "/reserve/header.html");
		req.setAttribute("main", "/reserve/main.jsp");
		req.setAttribute("footer", "/reserve/footer.html");
		RoomDao roomDao = RoomDao.getInstance();
		req.setAttribute("room", roomDao.selectRoom(Integer.parseInt(req.getParameter("room"))));
		req.getRequestDispatcher("/reserve/layout.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession();
		String id = (String) session.getAttribute("hlogin_id");
		if(id == null || id.equals("")) {
			resp.sendRedirect(req.getContextPath() + "/login");
		}else {
			
		}
	}
}
