package semi.room.controller.hj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/admin/addroom")
public class RoomAddRoomController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("header", "/Admin/header.jsp");
		req.setAttribute("main", "/Admin/Adminaddroom.jsp");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/Admin/layout.jsp").forward(req, resp);
	}
}
