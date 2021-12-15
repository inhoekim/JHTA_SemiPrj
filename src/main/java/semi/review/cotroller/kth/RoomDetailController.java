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
		String spageNum = req.getParameter("pageNum");
		int room_id = Integer.parseInt(req.getParameter("room_id"));
		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		int startRow = (pageNum - 1) * 10 + 1;
		int endRow = startRow + 4;
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		ArrayList<ReviewBoardVo> list =  dao.roomDetailReview(room_id, startRow, endRow);
		
		int count = dao.getPageMaxNum(null, null, room_id);
		int pageCount = (int)Math.ceil(count / 10.0);
		
		int startPage = ((pageNum - 1) / 10 * 10) + 3;
		int endPage = startPage + 2;
		
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		req.setAttribute("list", list);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("room_id", room_id);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.getRequestDispatcher("/review/roomDetail.jsp").forward(req, resp);
	}
	
}

