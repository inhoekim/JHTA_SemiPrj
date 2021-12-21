package semi.alarm.controller.kth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import semi.review.dao.kth.ReviewCommentsDao;
import semi.review.vo.kth.ReviewCommentsVo;

@WebServlet("/alarm/list")
public class AlarmListController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String hlogin_id = (String)session.getAttribute("hlogin_id");

		ReviewCommentsDao reviewDao = ReviewCommentsDao.getInstance();
		ArrayList<ReviewCommentsVo> list = reviewDao.selectReview(hlogin_id);
		
		int alarmCount = reviewDao.alarmCount(hlogin_id);
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		JSONArray jsonArr = new JSONArray();
		JSONObject json = new JSONObject();
		json.put("alarmCount", alarmCount);
		jsonArr.put(json);
		for (ReviewCommentsVo vo : list) {
			JSONObject json2 = new JSONObject();
			json2.put("review_id", vo.getReview_id());
			json2.put("comment_id", vo.getComment_id());
			json2.put("hlogin_id", vo.getHlogin_id());
			json2.put("content", vo.getContent());
			jsonArr.put(json2);
		}
		
		pw.print(jsonArr);
	}
	
}
