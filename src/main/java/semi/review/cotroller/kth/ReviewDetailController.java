package semi.review.cotroller.kth;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		
		ReviewBoardDao dao = ReviewBoardDao.getInstance();
		ReviewBoardVo vo = dao.getReivew(review_id);
		
		ImgFileDao imgFileDao = ImgFileDao.getInstance();
		String src_name = imgFileDao.getImage(review_id);
		
		// 디렉터리 주소
		ServletContext context = this.getServletContext();
		
		// 주소 경로 html에 맞게 변경
		String path = context.getRealPath("/images");
		String change = path.replace("\\", "/");
		String saveDir = change.substring(change.lastIndexOf("/semiPrj"));
		
		req.setAttribute("vo", vo);
		req.setAttribute("src_name", src_name);
		req.setAttribute("src", saveDir + "/" + src_name);
		req.getRequestDispatcher("/review/reviewDetail.jsp").forward(req, resp);
	}
	
}
