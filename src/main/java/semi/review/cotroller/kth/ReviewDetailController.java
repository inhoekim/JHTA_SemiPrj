package semi.review.cotroller.kth;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.img_file.dao.kth.ImgFileDao;
import semi.review.dao.kth.ReviewBoardDao;
import semi.review.vo.kth.RecommendVo;
import semi.review.vo.kth.ReviewBoardVo;

@WebServlet("/review/detail")
public class ReviewDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		HttpSession session = req.getSession();
		String hlogin_id = (String)session.getAttribute("hlogin_id");
		
		// 로그인을 안 했을 경우
		if (hlogin_id == null) {
			hlogin_id = "guest";
		}
		
		
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			Cookie cookie = new Cookie("review_id_" + review_id, hlogin_id);
			cookie.setPath("/"); // 쿠키 접근 경로 설정
			cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효기간
			resp.addCookie(cookie);
		}
		// 쿠키 체크
		boolean hitsCheck = false;
		
		// 쿠키 네임을 비교하기 위한 변수
		String hitName = "review_id_" + review_id;
		// 조회 수 중복방지
		for (Cookie cook : cookies) {
			if (hlogin_id.equals(cook.getValue()) && cook.getName().equals(hitName)) {
				hitsCheck = true;
				break;
			} else {
				hitsCheck = false;
			}
		}
		
		// 추천수 중복 클릭 방지를 위한 변수
		String cookieReviewId =  "recommend_" + review_id;
		String cookieHloginId = "recommend_" + hlogin_id;
		// 쿠키 체크
		String cookieCheck = "success";
		for (Cookie cookie : cookies) {
			if (cookieReviewId.equals(cookie.getName()) && 
					cookieHloginId.equals(cookie.getValue())) {
				cookieCheck = "fail";
				break;
			}
		}
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		
		if (!hitsCheck) {
			dao.viewsUpdate(review_id);
		}
		
		ReviewBoardVo vo = dao.getReivew(review_id);
		RecommendVo rVo = dao.getRecommend(review_id);
		ImgFileDao imgFileDao = ImgFileDao.getInstance();
		String src_name = imgFileDao.getImage(review_id);
		
		// 디렉터리 주소
		ServletContext context = this.getServletContext();
		
		// 주소 경로 html에 맞게 변경
		String path = context.getRealPath("/images");
		String change = path.replace("\\", "/");
		String saveDir = change.substring(change.lastIndexOf("/semiPrj"));
		
		req.setAttribute("cookieCheck", cookieCheck);
		req.setAttribute("rVo", rVo);
		req.setAttribute("vo", vo);
		req.setAttribute("hlogin_id", hlogin_id);
		req.setAttribute("src_name", src_name);
		req.setAttribute("src", saveDir + "/" + src_name);
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("main", "/review/reviewDetail.jsp");
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/review/layout.jsp").forward(req, resp);
		
	}
	
}
