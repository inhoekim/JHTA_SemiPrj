package semi.review.cotroller.kth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/review/insert")
public class ReviewInsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String title = req.getParameter("title");
		String rate = req.getParameter("rating");
		
		int rating = 1;
		
		if (rate != null) {
			rating = Integer.parseInt(rate);
		}
		
		
	}
}
