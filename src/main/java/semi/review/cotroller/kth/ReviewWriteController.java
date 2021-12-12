package semi.review.cotroller.kth;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.img_file.dao.kth.ImgFileDao;
import semi.img_file.vo.kth.ImgFileVo;
import semi.review.dao.kth.ReviewBoardDao;
import semi.review.vo.kth.ReviewBoardVo;

@WebServlet("/review/write")
public class ReviewWriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//int room_id = Integer.parseInt(req.getParameter("room_id"));
		int room_id = 1;
		resp.sendRedirect(req.getContextPath() + "/review/reviewWrite.jsp?room_id=" + room_id);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 디렉터리 주소 추출
		ServletContext context = this.getServletContext();
		String saveDir = context.getRealPath("/images");
		System.out.println("경로" + saveDir);
		
		MultipartRequest mr = new MultipartRequest(
				req,
				saveDir, // 저장 경로
				1024 * 1024 * 10, // 최대 업로드 가낭한 크기(btye 단위)
				"utf-8",
				new DefaultFileRenamePolicy() // 동일한 파일명 존재 시 처리할 객체
		);
		
		HttpSession session = req.getSession();
		String hlogin_id = (String)session.getAttribute("hloing_id");
		
		// getParameter
		int review_id = Integer.parseInt(mr.getParameter("review_id"));
		int room_id = Integer.parseInt(mr.getParameter("room_id"));
		int rate = Integer.parseInt(mr.getParameter("rate"));
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String org_name = mr.getOriginalFileName("file"); // 전송된 파일명
		String src_name = mr.getFilesystemName("file"); // 저장된 파일명
		// getParameter end
		
		// 파일 확장자명 추출
		String type = src_name.substring(src_name.lastIndexOf(".") + 1);
		System.out.println("타입:" + type);
		// 파일 저장
		File file = new File(saveDir + "\\" + src_name);
		
	
		// 이미지 파일 DAO
		if (org_name != null || !org_name.equals("")) {
			ImgFileDao fileDao = ImgFileDao.getInstance();
			ImgFileVo fileVo = new ImgFileVo(0, review_id, type, org_name, src_name, null);
			fileDao.imgFileInsert(fileVo);
		}
		
		// 리뷰 DAO
		ReviewBoardDao reviewDao = ReviewBoardDao.getInstance();
		ReviewBoardVo reviewVo = new ReviewBoardVo(0, room_id, hlogin_id,
				title, content, rate, 0, 0, null, null);
		reviewDao.reviewInsert(reviewVo);
		
		
		
	}
}
