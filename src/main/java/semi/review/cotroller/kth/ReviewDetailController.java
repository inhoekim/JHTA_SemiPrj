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

import semi.img_file.dao.kth.ImgFileDao;
import semi.review.dao.kth.ReviewBoardDao;
import semi.review.vo.kth.ReviewBoardVo;

@WebServlet("/review/detail")
public class ReviewDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int review_id = Integer.parseInt(req.getParameter("review_id"));
		
		String reviewId = Integer.toString(review_id);
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			Cookie cookie = new Cookie("review_id_" + review_id, reviewId);
			cookie.setPath("/"); // 쿠키 접근 경로 설정
			cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효기간
			resp.addCookie(cookie);
		}
		// 쿠키 체크
		boolean check = false;
		// 조회 수 중복방지
		for (Cookie cook : cookies) {
			if (Integer.toString(review_id).equals(cook.getValue())) {
				check = true;
				break;
			} else {
				check = false;
			}
		}
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		
		if (!check) {
			dao.viewsUpdate(review_id);
		}
		
		ReviewBoardVo vo = dao.getReivew(review_id);
		
		ImgFileDao imgFileDao = ImgFileDao.getInstance();
		String src_name = imgFileDao.getImage(review_id);
		
		// 디렉터리 주소
		ServletContext context = this.getServletContext();
		
		// 주소 경로 html에 맞게 변경
		String path = context.getRealPath("/images");
		String change = path.replace("\\", "/");
		String saveDir = change.substring(change.lastIndexOf("/semiPrj"));
		System.out.println("src_name : " + src_name);
		
		req.setAttribute("vo", vo);
		req.setAttribute("src_name", src_name);
		req.setAttribute("src", saveDir + "/" + src_name);
		req.setAttribute("main", "/review/reviewDetail.jsp");
		req.getRequestDispatcher("/home/layout.jsp").forward(req, resp);
		
	}
	
}
