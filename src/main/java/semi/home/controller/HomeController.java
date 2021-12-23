package semi.home.controller;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.room.dao.ihk.RoomDao;
@WebServlet("/home") 
public class HomeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spage=req.getParameter("spage");
		
		if(spage==null){
	    	req.setAttribute("searchbar","/home/searchBar.jsp");
	    	spage="/home/main.jsp";
	    }
		
		req.setAttribute("header", "/home/header.jsp");
		req.setAttribute("main", spage);
		req.setAttribute("footer", "/home/footer.html");
		System.out.println(RoomDao.getInstance().getReserves(1));
		req.getRequestDispatcher("/home/layout.jsp").forward(req, resp); 
	}
}
  