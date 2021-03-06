package semi.review.cotroller.kth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import semi.review.dao.kth.ReviewBoardDao;
import semi.review.vo.kth.ReviewBoardVo;

@WebServlet("/review/list")
public class ReviewListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum = req.getParameter("pageNum");
		String field = req.getParameter("field");
		String keyword = req.getParameter("keyword");
		int pageNum = 1;
		
		HttpSession session = req.getSession();
		String admin_id = (String)session.getAttribute("admin_id");
		
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 9;
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		ArrayList<ReviewBoardVo> list = dao.reviewList(startRow, endRow, field, keyword);
		
		int count = dao.getPageMaxNum(field, keyword, 0);
		// 리뷰 댓글수 추출
		ArrayList<Integer> list2 = dao.reviewCommentsCount(startRow, endRow, field, keyword);
		int pageCount = (int)Math.ceil(count / 10.0);
		int startPage = (pageNum - 1) / 10 * 10 + 1;
		int endPage = startPage + 9;
		
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		
		if ("admin1".equals(admin_id)) {
			req.setAttribute("header", "/Admin/header.jsp");
			req.setAttribute("main", "/review/roomReviewList.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/Admin/layout.jsp").forward(req, resp);
		} else {
			req.setAttribute("header", "/home/header.jsp");
			req.setAttribute("main", "/review/roomReviewList.jsp");
			req.setAttribute("footer", "/home/footer.html");
			req.getRequestDispatcher("/review/layout.jsp").forward(req, resp);
		}
	}
}
