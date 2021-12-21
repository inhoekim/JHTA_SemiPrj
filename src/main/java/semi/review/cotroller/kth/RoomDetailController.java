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

import semi.review.dao.kth.ReviewBoardDao;
import semi.review.vo.kth.ReviewBoardVo;

@WebServlet("/room/detail")
public class RoomDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int room_id = Integer.parseInt(req.getParameter("room_id"));
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		
		ArrayList<ReviewBoardVo> list =  dao.roomDetailReview(room_id, 0, 0);
		
		
		int count = dao.getPageMaxNum(null, null, room_id);
		
		req.setAttribute("list", list);
		req.setAttribute("room_id", room_id);
		req.setAttribute("review_cnt", count);
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("main", "/review/roomDetail.jsp");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/review/layout.jsp").forward(req, resp);
//		req.getRequestDispatcher("/review/roomDetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int room_id = Integer.parseInt(req.getParameter("room_id"));
		System.out.println("room_id : " + room_id);
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		ArrayList<ReviewBoardVo> list =  dao.roomDetailReview(room_id, 0, 0);
		
		int count = dao.getPageMaxNum(null, null, room_id);
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		JSONArray jsonArr = new JSONArray();
		
		for (ReviewBoardVo vo : list) {
			JSONObject json2 = new JSONObject();
			json2.put("review_id", vo.getReview_id());
			json2.put("hlogin_id", vo.getHlogin_id());
			json2.put("content", vo.getContent());
			json2.put("rate", vo.getRate());
			json2.put("created_day", vo.getCreated_day());
			jsonArr.put(json2);
		}
		JSONObject json = new JSONObject();
		json.put("review_cnt", count);
		json.put("room_id", room_id);
		jsonArr.put(json);
		
		pw.print(jsonArr);
	}
	
}

