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

@WebServlet("/comments/insert")
public class CommentsInsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum = req.getParameter("pageNum");
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		String content = req.getParameter("content");
		// 쿠키에서 로그인 값 가져와야 함
		String hlogin_id = "hong"; // 임시 더미 데이터 삭제 예정
		
		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		// 리뷰 등록
		ReviewCommentsDao dao = ReviewCommentsDao.getInstance();
		ReviewCommentsVo vo = new ReviewCommentsVo(0, review_id, hlogin_id, content, 0, 0, 0, 1, null);
		dao.commentInsert(vo);
		
		// 한 페이지에 15개씩
		int startRow = (pageNum - 1) * 15 + 1;
		int endRow = startRow + 14;
		
		ArrayList<ReviewCommentsVo> list = dao.getCommentList(review_id, startRow, endRow);
		// 총 댓글 수
		int count = dao.commentMaxNum();
		// 5 페이지씩 페이징 처리
		int pageCount = (int)Math.ceil(count / 15.0);
		int startPage = ((pageNum - 1) / 10 * 10) + 1; 
		int endPage = startPage + 4;
		
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
			json2.put("ref", rVo.getRef());
			json2.put("lev", rVo.getLev());
			json2.put("step", rVo.getStep());
			json2.put("created_day", rVo.getCreated_day());
			jsonArr.put(json2);
		}
		
		pw.print(jsonArr);
		
	}
}
