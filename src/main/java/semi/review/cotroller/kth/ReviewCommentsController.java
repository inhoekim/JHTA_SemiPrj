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

@WebServlet("/review/comments")
public class ReviewCommentsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		String content = req.getParameter("content");
		// 쿠키에서 로그인 값 가져와야 함
		String hlogin_id = "hong"; // 임시 더미 데이터 삭제 예정
		System.out.println("review_id : " + review_id);
		System.out.println("content : " + content);
		
		ReviewCommentsDao dao = ReviewCommentsDao.getInstance();
		ReviewCommentsVo vo = new ReviewCommentsVo(0, review_id, hlogin_id, content, 0, 0, 0, 1, null);
		dao.commentInsert(vo);
		ArrayList<ReviewCommentsVo> list = dao.getCommentList(review_id);
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		JSONArray jsonArr = new JSONArray();
		
		for (ReviewCommentsVo rVo : list) {
			JSONObject json = new JSONObject();
			json.put("comment_id", rVo.getComment_id());
			json.put("hlogin_id", rVo.getHlogin_id());
			json.put("content", rVo.getContent());
			json.put("ref", rVo.getRef());
			json.put("lev", rVo.getLev());
			json.put("step", rVo.getStep());
			json.put("created_day", rVo.getCreated_day());
			jsonArr.put(json);
		}
		
		pw.print(jsonArr);
	}
}
