package semi.review.cotroller.kth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import semi.review.dao.kth.ReviewCommentsDao;
import semi.review.vo.kth.ReviewCommentsVo;

@WebServlet("/comments/list")
public class CommentsListController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		String spageNum = req.getParameter("pageNum");
		
		int pageNum = 1;
		
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 14;
		
		ReviewCommentsDao dao = ReviewCommentsDao.getInstance();
		ArrayList<ReviewCommentsVo> list = dao.getCommentList(review_id, startRow, endRow);
		
		int count = dao.commentCountNum(review_id);
		
		int pageCount = (int)Math.ceil(count / 15.0);
		int startPage = ((pageNum - 1) / 10 * 10) + 1; 
		int endPage = startPage + 9;
		
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();

		JSONArray jsonArr = new JSONArray();
		JSONObject json = new JSONObject();
		
		json.put("pageNum", pageNum);
		json.put("pageCount", pageCount);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("count", count);
		json.put("review_id", review_id);
		jsonArr.put(json);
		
		for (ReviewCommentsVo rVo : list) {
			JSONObject json2 = new JSONObject();
			json2.put("comment_id", rVo.getComment_id());
			json2.put("hlogin_id", rVo.getHlogin_id());
			json2.put("content", rVo.getContent());
			json2.put("created_day", rVo.getCreated_day());
			jsonArr.put(json2);
		}
		pw.print(jsonArr);
		
	}
	
}
