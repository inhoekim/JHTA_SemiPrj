package semi.review.cotroller.kth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import semi.review.dao.kth.ReviewBoardDao;
import semi.review.vo.kth.RecommendVo;

@WebServlet("/recommend/update")
public class RecommendUpdateController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		int recommendNum = Integer.parseInt(req.getParameter("recommendNum"));
		
		HttpSession session = req.getSession();
		String hlogin_id = (String)session.getAttribute("hlogin_id");
		
		Cookie[] cookies = req.getCookies();
		
		String cookieReviewId =  "recommend_" + review_id;
		String cookieHloginId = "recommend_" + hlogin_id;
		
		// 쿠키 체크
		String check = "success";
		
		for (Cookie cookie : cookies) {
			if (cookieReviewId.equals(cookie.getName()) && 
					cookieHloginId.equals(cookie.getValue())) {
				check = "fail";
				break;
			}
		}
		
		// 추천수 쿠키 생성
		if (check.equals("success")) {
			Cookie cookie = new Cookie("recommend_" + review_id, cookieHloginId);
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효기간
			resp.addCookie(cookie);
			check = "fail";
		}
		
		
		
		
		int thumb_up = 0;
		int thumb_down = 0;
		if (recommendNum > 0) {
			thumb_up = recommendNum;
		} else {
			thumb_down = recommendNum;
		}
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		RecommendVo vo = null;
		vo = new RecommendVo(0, review_id, thumb_up, thumb_down);
		// 리뷰 보드 추천 수 등록
		dao.reviewRecommendAdd(review_id, recommendNum);
		// 추천 수 등록
		dao.recommendUpdate(vo);
		
		vo = dao.getRecommend(review_id);
		
		JSONObject json = new JSONObject();
		json.put("thumb_up", vo.getThumb_up());
		json.put("thumb_down", vo.getThumb_down());
		json.put("cookieCheck", check);
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.print(json);
	}
	
}
