package semi.member.controller.hj;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.dao.hj.MemberDao;
@WebServlet("/login")
public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/hj/login_hj.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String hlogin_id=req.getParameter("hlogin_id");
		String pwd=req.getParameter("pwd");
		String chk=req.getParameter("chk");
			
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("hlogin_id", hlogin_id);
		map.put("pwd", pwd);

		MemberDao dao=new MemberDao(); //dao에서 아이디 비밀번호가 맞는지 확인
		boolean b=dao.isMember(map);	
		
		if(b) {
			HttpSession session=req.getSession();
			session.setAttribute("hlogin_id", hlogin_id);
			if(chk!=null){ //체크박스에 체크한 경우
				Cookie cook1=new Cookie("hlogin_id",hlogin_id);
				cook1.setMaxAge(10); //30분
				cook1.setPath("/");
				resp.addCookie(cook1);
				Cookie cook2=new Cookie("pwd",pwd);
				cook2.setMaxAge(10);
				cook2.setPath("/");
				resp.addCookie(cook2);
			}
			resp.sendRedirect("/semiPrj/hj/main_test.jsp");
		}else {
			req.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않아요");
			req.getRequestDispatcher("/hj/login_hj.jsp").forward(req, resp);
		}
	}
}
