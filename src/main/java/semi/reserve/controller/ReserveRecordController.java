package semi.reserve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import semi.reserve.dao.ihk.ReserveDao;

@WebServlet("/reserve/record")
public class ReserveRecordController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("hlogin_id");
		if(id == null || id.equals("")) {
			resp.sendRedirect(req.getContextPath() + "/home?spage=/home/login.jsp");
			return;
		}
		req.setCharacterEncoding("utf-8");
		int page = 1;
		if(!(req.getParameter("page") == null || req.getParameter("page").equals(""))) {
			page = Integer.parseInt(req.getParameter("page"));
			if(page <= 0) page = 1;
		}
		ReserveDao reserveDao = ReserveDao.getInstance();
		int totalRows = reserveDao.getRowCount();
		int totalPages = (int) Math.ceil(totalRows / 5.0);
		if(totalPages == 0) totalPages = 1;
		if(page > totalPages) page = totalPages;
		int end = page * 5;
		int first = end - 4;
		int startPage = (page - 1) / 10 + 1;
		int endPage = startPage + 9;
		if(endPage > totalPages) endPage = totalPages;
		
		JSONArray arr = reserveDao.getRangeRow(first, end);
		System.out.println(arr);
		req.setAttribute("jsonArr", arr);
		String path = "/home?spage=/home/reservation.jsp&page=" + page + "&startPage=" + startPage + "&endPage=" + endPage;
		req.getRequestDispatcher(path).forward(req, resp);
	}
}
