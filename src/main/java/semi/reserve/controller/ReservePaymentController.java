package semi.reserve.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.reserve.dao.ihk.ReserveDao;

@WebServlet("/reserve/payment")
public class ReservePaymentController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int reserve_id = Integer.parseInt(req.getParameter("reserve_id"));
		ReserveDao reserveDao = ReserveDao.getInstance();
		int result = reserveDao.confirmReserve(reserve_id);
		if(result > 0) {
			resp.sendRedirect(req.getContextPath() + "/reserve/record");
		}else {
			req.setAttribute("result", "fail");
			req.setAttribute("failMsg", "결제과정에서 오류가 발생하였습니다. 결제에 실패하였습니다!");
			req.getRequestDispatcher("/home?spage=/home/result.jsp").forward(req, resp);
		}
	}
}
