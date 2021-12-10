package semi.member.controller.hj;

import java.io.IOException;
import java.util.HashMap;

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
		resp.sendRedirect(req.getContextPath() + "/login_hj.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String chk=req.getParameter("chk");
		
		if(chk==null){ //체크박스가 체크가 안된 경우
			//쿠키삭제
			Cookie cook1=new Cookie("id",id);
			cook1.setMaxAge(0);
			cook1.setPath("/");
			Cookie cook2=new Cookie("pwd",pwd);
			cook2.setMaxAge(0);
			cook2.setPath("/");
			resp.addCookie(cook1);
			resp.addCookie(cook2);
		}else{	//체크박스가 체크된 경우
			Cookie cook1=new Cookie("id",id);
			cook1.setMaxAge(60*60*24*30); //쿠키유지시간 30일 60*60=1시간 24시간에 30일 1년은 365
			cook1.setPath("/");
			Cookie cook2=new Cookie("pwd",pwd);
			cook2.setMaxAge(60*60*24*30); //쿠키유지시간 30일
			cook2.setPath("/");
			resp.addCookie(cook1);
			resp.addCookie(cook2);
		}	
		
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		MemberDao dao=new MemberDao(); //dao에서 아이디 비밀번호가 맞는지 확인
		boolean b=dao.isMember(map);
		
		if(b) {
			HttpSession session=req.getSession();
			session.setAttribute("id", id);
			resp.sendRedirect(req.getContextPath() + "/main.jsp");
		}else {
			req.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않아요");
			req.getRequestDispatcher("main.jsp").forward(req, resp);
		}
		
	}
}
