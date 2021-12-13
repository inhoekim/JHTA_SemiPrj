package semi.review.cotroller.kth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/review/error")
public class ReviewErrorMsgController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String content = req.getParameter("title");
		String title = req.getParameter("content");
		String fileName = req.getParameter("file");
		
		// 파일 확장자명 추출
		String type = fileName.substring(fileName.lastIndexOf(".") + 1);
		System.out.println("타입 : " + type);
		System.out.println("content : " + content);
		System.out.println("title : " + title);
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = resp.getWriter();
	}
	
}
