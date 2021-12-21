package semi.review.cotroller.kth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.review.dao.kth.ReviewBoardDao;

@WebServlet("/review/delete")
public class ReviewDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		System.out.println("review_id : " + review_id);
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		boolean check = dao.reviewDelete(review_id);
		
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("main", "/review/list");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/review/layout.jsp").forward(req, resp);
	}
	
}
