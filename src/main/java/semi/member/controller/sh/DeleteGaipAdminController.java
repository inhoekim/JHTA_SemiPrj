package semi.member.controller.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.dao.je.HloginDaoje;



@WebServlet("/Admin/delete")
public class DeleteGaipAdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hlogin_id=req.getParameter("hlogin_id");
		HloginDaoje dao=new HloginDaoje();
		int n=dao.admindelete(hlogin_id);
	
		if(n>0) {
			
			resp.sendRedirect(req.getContextPath() +"/select/list");//목록을 보여주는 리스트컨트롤러로 이동
		}else {
			req.setAttribute("result", "fail");
			req.getRequestDispatcher("/sh/result.jsp").forward(req, resp);
		}		
	}
}