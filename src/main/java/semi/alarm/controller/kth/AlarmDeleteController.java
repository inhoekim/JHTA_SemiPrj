package semi.alarm.controller.kth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import semi.review.dao.kth.ReviewCommentsDao;

@WebServlet("/alarm/delete")
public class AlarmDeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int comment_id = Integer.parseInt(req.getParameter("comment_id"));
		System.out.println(comment_id);
		// 알림 제거
		ReviewCommentsDao dao = ReviewCommentsDao.getInstance();
		dao.alarmDelete(comment_id);
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		JSONObject json = new JSONObject();
		
		pw.print(json);
	}
}
