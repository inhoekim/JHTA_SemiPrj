package semi.member.controller.sh;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.je.HloginVoje;
import semi.member.dao.je.HloginDaoje;



@WebServlet("/sh/Adminlist")
public class AdminListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum=req.getParameter("pageNum");
		String field=req.getParameter("field");
		String keyword=req.getParameter("keyword");
		
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)*10+1;
		int endRow=(startRow+9);
		HloginDaoje dao=new HloginDaoje();
		ArrayList<HloginVoje> list=dao.list(startRow, endRow,field,keyword);
		int pageCount=(int)Math.ceil(dao.getCount(field,keyword)/10.0);
		System.out.println("페이지 카운트 >>>" + pageCount);
		
		int startPage=(pageNum-1)/10*10+1;
		int endPage=startPage+9;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		req.getRequestDispatcher("/Admin/Adminlist.jsp").forward(req, resp);
	}

}
