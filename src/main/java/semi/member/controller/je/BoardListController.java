package semi.member.controller.je;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.je.BoardVoje;
import semi.member.dao.je.BoardDaoje;
@WebServlet("/board/list")
public class BoardListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum = req.getParameter("pageNum");
		int pageNum =1;
		if(spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		int startRow = (pageNum-1)*10+1;
		int enfRow = startRow+9;
		BoardDaoje dao=new BoardDaoje();
		ArrayList<BoardVoje> list=dao.list(startRow, enfRow);
		int count=dao.getCount();
		int pageCount=(int)Math.ceil(count/10.0);
		int startPageNum=((pageNum-1)/10*10)+1;
		int endPageNum=startPageNum+9;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPageNum);
		req.setAttribute("endPage", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/je/BoardList.jsp").forward(req, resp);
				
	}

}
