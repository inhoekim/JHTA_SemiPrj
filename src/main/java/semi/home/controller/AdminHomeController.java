package semi.home.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/admin")
public class AdminHomeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String apage=req.getParameter("apage");
	    if(apage==null){
	    	apage="/home/main.jsp";
	    }
		req.setAttribute("header", "/Admin/header.jsp");
		req.setAttribute("main", apage);
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/Admin/layout.jsp").forward(req, resp);
	}
}
