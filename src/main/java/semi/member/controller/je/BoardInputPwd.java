package semi.member.controller.je;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.Vo.je.BoardVoje;
import semi.member.dao.je.BoardDaoje;

@WebServlet("/service/je/inputpwd")
public class BoardInputPwd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pwd = req.getParameter("pwd");
		int service_id = Integer.parseInt(req.getParameter("service_id"));
		BoardDaoje dao = new BoardDaoje();
		BoardVoje vo = dao.select(pwd,service_id);
		
	    if(vo!=null) {
	    //String content =vo.getContent();
		//vo.setContent(content.replaceAll("\n","<br>"));
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/je/Service/detail.jsp").forward(req, resp);
	     }else {
	    req.getRequestDispatcher("/je/Service/Boarddetailfail.jsp").forward(req, resp);
	     }
		}
	}

