package semi.review.cotroller.kth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import semi.review.dao.kth.ReviewCommentsDao;
import semi.review.vo.kth.ReviewCommentsVo;

@WebServlet("/comments/insert")
public class CommentsInsertController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		String content = req.getParameter("content");
		
		HttpSession session = req.getSession();
		String hlogin_id = (String)session.getAttribute("hlogin_id");
		
		// 리뷰 등록
		ReviewCommentsDao dao = ReviewCommentsDao.getInstance();
		ReviewCommentsVo vo = new ReviewCommentsVo(0, review_id, hlogin_id, content, 1, null);
		dao.commentInsert(vo);
		
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		JSONObject json = new JSONObject();

		pw.print(json);
		
	}
}
