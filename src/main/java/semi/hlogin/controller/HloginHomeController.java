package semi.hlogin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/hlogin")
public class HloginHomeController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spage=req.getParameter("spage");
	    if(spage==null){
	    	spage="/Hlogin/main.jsp";
	    }
		req.setAttribute("header", "/Hlogin/header.jsp");
		req.setAttribute("main", spage);
		req.setAttribute("footer", "/home/footer.html");
		req.getRequestDispatcher("/Hlogin/layout.jsp").forward(req, resp);
	}

}
