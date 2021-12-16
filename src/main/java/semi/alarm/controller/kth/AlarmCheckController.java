package semi.alarm.controller.kth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.review.dao.kth.ReviewCommentsDao;

@WebServlet("/alarm/check")
public class AlarmCheckController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int comment_id = Integer.parseInt(req.getParameter("comment_id"));
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		ReviewCommentsDao dao = ReviewCommentsDao.getInstance();
		dao.alarmDelete(comment_id);
		
		resp.sendRedirect(req.getContextPath() + "/review/detail?review_id=" + review_id);
	}
}
