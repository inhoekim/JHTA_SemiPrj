package semi.review.cotroller.kth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.review.dao.kth.ReviewBoardDao;
import semi.review.vo.kth.ReviewBoardVo;

@WebServlet("/review/update")
public class ReivewUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		ReviewBoardVo vo = dao.getReivew(review_id);
		
		req.setAttribute("vo", vo);
		
		req.getRequestDispatcher("/semiPrj/review/reviewEdit.jsp");
	}
}
